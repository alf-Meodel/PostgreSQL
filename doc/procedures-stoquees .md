<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# Procédures Stoquées

![border](../assets/line/border_r.png)

```
Ne pas oublier d'ajouter les types lors d'une procédure stockée

CREATE OR REPLACE PROCEDURE ajouter_user(nom_utilisateur VARCHAR, email_utilisateur VARCHAR)
```

```

afficher toutes les procédures stockées : \df+
             faire defiler chaque ligne : ENTER
```

```
Si vous utilisez une boucle FOR ... IN SELECT, la variable de la boucle doit être de type RECORD ou explicitement déclarée comme une liste de variables correspondant aux colonnes sélectionnées.
```

# Sommaire

- [Définition](#définition)
- [Ajouter USER](#ajouter-user)
  - [Mise en place ](#mise-en-place)
  - [Creation de notre procédure stockée](#creation-de-notre-procédure-stockée)
  - [Call Procédure stockée ](#call-procédure-stockée)
- [Afficher users](#afficher-users)
  - [Type Record](#type-record)
  - [Boucle FOR](#boucle-for)
  - [Variables scalaires (en détaillant les champs )](#variables-scalaires)
- [Supprimer une procédure](#supprimer-une-procédure)

## Définition

- Les procédures stockées sont des ensembles d'instructions SQL encapsulées qui permettent d'effectuer des opérations complexes au sein de la base de données. Ces procédures sont utiles pour automatiser des tâches répétitives ou encapsuler une logique métier au sein du serveur de base de données.

![border](../assets/line/line_pink_point_l.png)

# AJOUTER USER

## Mise en place

- Dans un premier temps nous allons simplement nous connecter ou rejoindre directement une database existante

```
pgcli -U <ton_utilisateur>
pgcli -U <ton_utilisateur> -d <database>
```

- Puis nous allons créer une nouvelle base de donnée et nous connecter à elle

```
CREATE DATABASE exemple_db;
\c exemple_db
```

- Afin de créer notre première table

```
CREATE TABLE utilisateurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(150),
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Creation de notre procédure stockée

- Imaginons que nous souhaitions insérer un utilisateur dans la table utilisateurs ; nous pouvons utiliser un procédure stockée pour effectuer cela :

```
CREATE OR REPLACE PROCEDURE ajouter_utilisateur(nom_utilisateur VARCHAR, email_utilisateur VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO utilisateurs (nom, email)
    VALUES (nom_utilisateur, email_utilisateur);
    RAISE NOTICE 'Utilisateur ajouté : %, %', nom_utilisateur, email_utilisateur;
END;
$$;
```

## CALL procédure stockée

- Avant tout nous allons vori la liste des procédures stockées :

```
\df+
```

- Comme le corps de notre procédure strockée est un insert nous allons passer par elle pour insérer un utilisateur dans la table utilisateurs en utilisant **CALL**

```
CALL ajouter_utilisateur('Jean Dupont', 'jean.dupont@example.com');
CALL ajouter_utilisateur('Alice Martin', 'alice.martin@example.com');
```

- Ce qui va ajouter un utilisateur en executant la commande insert into présente dans notre procédure stockée

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

# AFFICHER USERS

- Pour afficher les utilisateurs nous allons créer une procédure stockée presque identique à la précédente à quelques détails pret :

### Type RECORD

- Declaration de la variable de type RECORD

```
DECLARE
     utilisateur_list RECORD; -- Déclaration de la variable de type RECORD
```

### Boucle FOR

FOR random_nom_descriptif IN suivit de la commande de selection permet de créer une variable qui va contenir les données de la table utilisateurs et qui va être utilisé dans la boucle FOR pour tout afficher

```
FOR utilisateur_list IN SELECT * FROM utilisateurs LOOP
```

- ensuite il ne faut pas oublier de fermer la boucle

```
END LOOP
```

### CODE COMPLET

```
postgres@(none):exemple_db> CREATE OR REPLACE PROCEDURE afficher_tous_les_utilisateurs()
 LANGUAGE plpgsql
 AS $$
 DECLARE
     utilisateur_list RECORD; -- Déclaration de la variable de type RECORD
 BEGIN
     RAISE NOTICE 'Liste des utilisateurs :';
     FOR utilisateur_list IN SELECT * FROM utilisateurs LOOP
         RAISE NOTICE 'Nom: %, Email: %', utilisateur_list.nom, utilisateur_list.email;
     END LOOP;
 END;
 $$;

CREATE PROCEDURE
```

## CALL POUR afficher tout

```
CALL afficher_tous_les_utilisateurs();
```

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

# VARIABLES SCALAIRES

- Mais une alternative plus légère existe , elle consiste à utiliser des variables scalaires pour afficher les données de la table

```
CREATE OR REPLACE PROCEDURE afficher_tous_les_utilisateurs()
LANGUAGE plpgsql
AS $$
DECLARE
    utilisateur_nom VARCHAR;
    utilisateur_email VARCHAR;
BEGIN
    RAISE NOTICE 'Liste des utilisateurs :';
    FOR utilisateur_nom, utilisateur_email IN SELECT nom, email FROM utilisateurs LOOP
        RAISE NOTICE 'Nom: %, Email: %', utilisateur_nom, utilisateur_email;
    END LOOP;
END;
$$;
```

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

# Supprimer une procédure

- Pour supprimer une procédure nous devons inclure le nom de la procédure ainsi que la liste de ses arguments (types uniquement, pas les noms),

## Exemple

- Supposons que nous avons la procédure suivante :

```
CREATE OR REPLACE PROCEDURE ajouter_super_utilisateur(
    nom_utilisateur VARCHAR,
    mail_utilisateur VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO utilisateurs (nom, email)
    VALUES (nom_utilisateur, mail_utilisateur);
END;
$$;
```

- Pour la supprimer nosu allons faire :

```
DROP PROCEDURE ajouter_super_utilisateur(VARCHAR, VARCHAR);
```

- Si la procédure n'a pas d'arguments nous pouvons simplement écrire :

```
DROP PROCEDURE afficher_tous_les_utilisateurs();
```

![border](../assets/line/line_pink_point_l.png)

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/border_r.png)
