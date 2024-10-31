<h1 style="color: #008080;">POSTEGRESQL MEMO </h1>

## Sommaire

- [ Tips ](#tips)
- [ DCL, DDL, DML,DQL](#modifier-une-column)
  - [DCL, Data Control Language](#les_databases)
  - [DDL, Data Definition Language](#les_tables)
  - [DML, Data Manipulation Language](#ajouter-une-column)
  - [DQL, Data Query Language](#modifier-une-column)

---

[↩️ Readme](/README.md)

---

# Tips

- Dans PostgreSQL, nosu ne pouvons pas créer de base de données directement depuis **pgcli**. Il faut sortir de **pgcli** et utiliser **psql** ou le **terminal PostgreSQL** :

- En SQL, les chaînes de texte doivent être entourées de guillemets simples ('). Les guillemets doubles (") sont réservés aux noms de colonnes ou de tables.

---

# DCL,DDL,DML,DQL

<h2 style="color: #008080;">DCL</h2>

##### (Data Control Language) : Gestion des permissions

Utilisé pour contrôler les droits d'accès aux données en PostgreSQL.
Exemples de commandes :

- **GRANT :** Donne des permissions aux utilisateurs (ex. GRANT SELECT ON table TO utilisateur;).
- **REVOKE :** Retire des permissions aux utilisateurs (ex. REVOKE SELECT ON table FROM utilisateur;).

<h2 style="color: #008080;">DDL</h2>

##### (Data Definition Language) : Définition de la structure de la base

Gère la création, modification et suppression des objets de la base de données (tables, index, etc.).
Exemples de commandes :

- **CREATE TABLE :** Crée une table.
- **ALTER TABLE :** Modifie la structure d’une table.
- **DROP TABLE :** Supprime une table.

<h2 style="color: #008080;">DML</h2>

##### (Data Manipulation Language) : Manipulation des données

Permet d’ajouter, modifier et supprimer les données dans les tables.
Exemples de commandes :

- **INSERT :** Ajoute des données.
- **UPDATE :** Modifie des données existantes.
- **DELETE :** Supprime des données.
- **?MERGE:** Pas dans toutes les BDD

<h2 style="color: #008080;">DQL</h2>

### (Data Query Language) : Interrogation des données

- Utilisé pour interroger et récupérer des données sans les modifier.
  Exemples de commande :

- **SELECT :** Extrait des données (ex. SELECT \* FROM table;).
  Chacune de ces catégories permet de gérer PostgreSQL de manière structurée : DCL pour les permissions, DDL pour la structure, DML pour les données, et DQL pour les requêtes.
