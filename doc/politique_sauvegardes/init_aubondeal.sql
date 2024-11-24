/* INITIALISATION DE LA BASE DE DONNÉES aubondeal POUR UNE API */

-------------------------------------------------
-- Étape 1 : Création de la base de données
-------------------------------------------------
-- Crée la base de données principale pour le projet "aubondeal".

CREATE DATABASE aubondeal;
-- Se connecter à la base de données "aubondeal" pour les opérations suivantes
\c aubondeal;

--------------------------------------------------------------------------------
-- Étape 2 : Création de l'utilisateur pour l'API et des rôles avec des permissions limitées
--------------------------------------------------------------------------------
-- Crée un utilisateur dédié pour l'API avec un mot de passe sécurisé.
-- Cet utilisateur sera utilisé par l'API pour interagir avec la base de données.

CREATE USER aubondeal_api WITH PASSWORD 'mot_de_passe_api';

-- Crée un rôle "manager" pour regrouper les permissions et faciliter la gestion des droits.
CREATE ROLE manager;

--------------------------------------------------------
-- Étape 3 : Attribution du rôle au nouvel utilisateur
--------------------------------------------------------
-- Associe le rôle "manager" à l'utilisateur "aubondeal_api" pour lui accorder des permissions spécifiques via le rôle.

GRANT manager TO aubondeal_api;

--------------------------------------------------------------------------------------------
-- Étape 4 : Création des extensions pgcrypto et uuid-ossp
--------------------------------------------------------------------------------------------
-- Active les extensions nécessaires pour générer des UUID et pour hacher les mots de passe.
-- pgcrypto est utilisé pour le hachage sécurisé des mots de passe.
-- uuid-ossp est utilisé pour générer des identifiants uniques (UUID) pour certaines tables.

CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

------------------------------------------------------------------
-- Étape 5 : Création des tables principales de la base de données
------------------------------------------------------------------

-- Table des utilisateurs
CREATE TABLE Users (
    user_uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),  -- Clé primaire unique générée pour chaque utilisateur
    user_pseudo VARCHAR(100) NOT NULL,                     -- Pseudo de l'utilisateur
    username VARCHAR(100) UNIQUE NOT NULL,                 -- Nom d'utilisateur unique
    user_password VARCHAR(100) NOT NULL,                   -- Mot de passe haché de l'utilisateur
    created_at TIMESTAMP NOT NULL DEFAULT NOW()            -- Date de création de l'utilisateur
);

-- Table des commandes
CREATE TABLE Orders (
    order_number SERIAL PRIMARY KEY,                       -- Clé primaire unique auto-incrémentée pour chaque commande
    order_total_cost_ht NUMERIC(10, 2) NOT NULL,           -- signifie que le nombre peut avoir jusqu'à 10 chiffres au total, dont 2 chiffres après la virgule.
    order_total_quantity INTEGER NOT NULL,                 -- Quantité totale de produits dans la commande
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),           -- Date de création de la commande
    deliver_at TIMESTAMP,                                  -- Date de livraison prévue pour la commande
    user_uuid UUID NOT NULL,                               -- Référence à l'utilisateur qui a passé la commande
    FOREIGN KEY (user_uuid) REFERENCES Users(user_uuid) ON UPDATE CASCADE -- Clé étrangère vers la table Users
);

-- Table des produits
CREATE TABLE Products (
    product_uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),  -- Clé primaire unique générée pour chaque produit
    product_name VARCHAR(100) NOT NULL,                        -- Nom du produit
    product_description TEXT,                                  -- Description du produit
    product_price NUMERIC(10, 2) NOT NULL,                     -- signifie que le nombre peut avoir jusqu'à 10 chiffres au total, dont 2 chiffres après la virgule.
    product_quantity INTEGER NOT NULL,                         -- Quantité de produit en stock
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),               -- Date de création du produit
    updated_at TIMESTAMP                                       -- Date de dernière mise à jour du produit
);

-- Table de relation entre les commandes et les produits
CREATE TABLE Belong (
    product_uuid UUID NOT NULL,                                -- Référence au produit dans la commande
    order_number INTEGER NOT NULL,                             -- Référence à la commande
    PRIMARY KEY (product_uuid, order_number),                  -- Clé primaire composée pour assurer l'unicité de la relation
    FOREIGN KEY (product_uuid) REFERENCES Products(product_uuid) ON UPDATE CASCADE, -- Clé étrangère vers Products
    FOREIGN KEY (order_number) REFERENCES Orders(order_number) ON UPDATE CASCADE    -- Clé étrangère vers Orders
);

------------------------------------------------------------------
-- Étape 6 : Création des fonctions et triggers pour la sécurité et les mises à jour automatiques
------------------------------------------------------------------

-- Fonction pour hacher les mots de passe des utilisateurs
CREATE OR REPLACE FUNCTION hash_password() RETURNS TRIGGER AS $$
BEGIN
    NEW.user_password := crypt(NEW.user_password, gen_salt('bf'));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger pour hacher automatiquement le mot de passe lors de l'insertion ou de la mise à jour dans Users
CREATE TRIGGER hash_user_password
BEFORE INSERT OR UPDATE OF user_password ON Users
FOR EACH ROW
EXECUTE FUNCTION hash_password();

-- Fonction pour mettre à jour automatiquement le champ updated_at lors d'une mise à jour dans Products
CREATE OR REPLACE FUNCTION set_updated_at() RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger pour mettre à jour le champ updated_at lors d'une modification sur la table Products
CREATE TRIGGER update_timestamp
BEFORE UPDATE ON Products
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

---------------------------------------------------------
-- Étape 7 : Attribution des privilèges au rôle "manager"
---------------------------------------------------------

-- Accorder les privilèges de lecture et de mise à jour au rôle "manager" sur les tables principales.
GRANT SELECT, INSERT, UPDATE ON TABLE Users, Orders, Products, Belong TO manager;

-- Révoquer les privilèges de mise à jour pour les autres utilisateurs (sauf pour le rôle "manager")
REVOKE UPDATE ON TABLE Users, Orders, Products, Belong FROM PUBLIC;

-- Accorder au rôle "manager" l'accès au schéma public et à la base de données aubondeal.
GRANT CONNECT ON DATABASE aubondeal TO manager;
GRANT USAGE ON SCHEMA public TO manager;

---------------------------------------------------------
-- Étape finale : Vérification et Consignes de Connexion
---------------------------------------------------------
-- La base de données est maintenant configurée avec les tables, les rôles et les triggers nécessaires.
-- L'utilisateur dédié à l'API est "aubondeal_api" avec des permissions limitées via le rôle "manager".
-- Pour se connecter à la base de données avec cet utilisateur dans pgcli :

-- Commande de connexion pour l'utilisateur API :
-- pgcli -U aubondeal_api -d aubondeal -h localhost -p 5432
