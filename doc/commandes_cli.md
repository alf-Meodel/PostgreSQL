<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# COMMANDES CLI

![border](../assets/line/border_l.png)

# Sommaire

- [Navigation](#navigation)
  - [Base](#base)
  - [Frequents](#frequents)
- [Pgcli](#pgcli)

  - [Commandes de connexion et de base de données](#commandes-de-connexion-et-de-base-de-données)
  - [Commandes pour les tables et les schémas](#commandes-pour-les-tables-et-les-schémas)
  - [Commandes pour les données](#commandes-pour-les-données)

  - [Commandes pour les utilisateurs et les rôles](#commandes-pour-les-utilisateurs-et-les-rôles)
  - [Commandes pour les permissions](#commandes-pour-les-permissions)
  - [Commandes de navigation et aide dans pgcli](#commandes-de-navigation-et-aide-dans-pgcli)

- [Config](#config)

![border](../assets/line/border_b.png)

<h2 style="color: #ab638c" id="navigation">Navigation</h2>

## Base

Pour nous connecter à **postegre**, nous allons utiliser la commande suivante :

#### ------------------ `sudo -i -u postgres` ------------------

## ------------------ `psql` ------------------

Pour nous connecter à **pgCLI**, nous allons utiliser la commande suivante :

`pgcli -U votre_utilisateur -d votre_base`

# Pgcli

## Commandes de connexion et de base de données

- Connexion à une base de données :

```
pgcli -U utilisateur -d nom_de_la_base
Exemple : pgcli -U postgres -d aubondeal
```

- Changer de base de données :

```
\c nom_de_la_base
Exemple : \c aubondeal
```

- Lister les bases de données :

```
\l
```

- Créer une base de données :

```
CREATE DATABASE nom_de_la_base;
```

## Commandes pour les tables et les schémas

- Lister les tables dans la base de données actuelle :

```
\dt
```

- Afficher la structure d'une table :

```
\d nom_de_la_table
Exemple : \d Users
```

- Créer une table :

```
CREATE TABLE nom_de_la_table (
colonne1 TYPE_CONSTRAINTS,
colonne2 TYPE_CONSTRAINTS,
...
);

Exemple :
CREATE TABLE Users (
user_id SERIAL PRIMARY KEY,
username VARCHAR(50) UNIQUE NOT NULL,
created_at TIMESTAMP DEFAULT NOW()
);
```

- Supprimer une table :

```
DROP TABLE nom_de_la_table;
```

## Commandes pour les données

- Insérer des données :

```
INSERT INTO nom_de_la_table (colonne1, colonne2, ...) VALUES (valeur1, valeur2, ...);

Exemple :
INSERT INTO Users (username) VALUES ('martial');
```

- Afficher les données d'une table :

```
SELECT \* FROM nom_de_la_table;
```

- Mettre à jour des données :

```
UPDATE nom_de_la_table SET colonne = nouvelle_valeur WHERE condition;

Exemple :
UPDATE Users SET username = 'martial_updated' WHERE user_id = 1;
```

- Supprimer des données :

```
DELETE FROM nom_de_la_table WHERE condition;

Exemple :
DELETE FROM Users WHERE user_id = 1;
```

## Commandes pour les utilisateurs et les rôles

- Créer un utilisateur :

```
CREATE USER nom_utilisateur WITH PASSWORD 'mot_de_passe';
Exemple : CREATE USER martial WITH PASSWORD 'mdp';
```

- Créer un rôle :

```
CREATE ROLE nom_role;
Exemple : CREATE ROLE manager;
```

- Attribuer un rôle à un utilisateur :

```
GRANT nom_role TO nom_utilisateur;
Exemple : GRANT manager TO martial;
```

- Révoquer un rôle d'un utilisateur :

```
REVOKE nom_role FROM nom_utilisateur;
```

- Supprimer un utilisateur :

```
DROP USER nom_utilisateur;
```

## Commandes pour les permissions

- Attribuer des permissions :

```
GRANT type_permission ON objet TO nom_role;
Exemple : GRANT SELECT, UPDATE ON Users TO manager;
```

- Révoquer des permissions :

```
REVOKE type_permission ON objet FROM nom_role;
Exemple : REVOKE UPDATE ON Users FROM PUBLIC;
```

## Commandes de navigation et aide dans pgcli

- Quitter pgcli :

```
\q
```

- Afficher la version de PostgreSQL :

```
SELECT version();
```

- Afficher l'historique des commandes :

```
\s
```

- Effacer l'écran du terminal :

```
\! clear
```

- Activer/désactiver la coloration syntaxique :

```
\syntax on
\syntax off
```

## Config

**f3** : activer le multiligne

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>
<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>
---

![border](../assets/line/border_r.png)
