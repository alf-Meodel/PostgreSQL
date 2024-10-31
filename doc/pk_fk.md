<h1 style="color: #008080;">GET STARTED </h1>

![pk_fp](/PostgreSQL/assets/img/fk_pk.webp)

# Primary Key

- Une clé primaire est automatiquement **indexé**
- une clé primaire par table
- mais la clé primaire peut etre composée de plusieurs champs : **PRIMARY KEY (id, nom)**

# Foreign Key

- Champs dans une autre table qui fait référence à la clé primaire d'une autre table

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
