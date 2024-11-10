<h1 style="color: #008080;">GET STARTED </h1>

<!-- ![postegrean](/assets/structure/test_line_b1.png) -->

![border](../assets/line/border_r.png)

## Sommaire

- [Premiers pas](#first-steps)

- [1.Data Control Language DCL](#data-control-language-dcl)

  - [CREATE ALTER DROP USER](#create-alter-drop-user)
  - [Exemple Pratique CREATE](#exemple-pratique-create)
  - [GRANT REVOQUE EXEMPLE](#grant-revoque-exemple)

- [2.Data Definition Language DDL](#data-definition-language-ddl)

  - [Créer un index](#créer-un-index)

  - [Contraintes PK FK unique not null default check](#contraintes-pk-fk-unique-not-null-default-check)

- [3.Manipulation des données avec DML](#manipulation-des-données-avec-dml)
  - [INSERT INTO](#insert-into)
  - [Grant / Accorder exemple](#grant)
- [4.Data Query Langage - DQL](#data-query-language-dql)

  - [Alias as PRENOM](#alias-as-prenom)
  - [WHERE ?](#where)
  - [Les Opérateurs Logiques AND OR NOT](#les-opérateurs-logiques-and-or-not)
  - [WHERE BETWEEEN](#where-between)
  - [WHERE IN](#where-in)
  - [LIKE et les caractères génériques wildcards](#like-et-les-caractères-génériques-wildcards)

  - [Gérer les NULL](#gérer-les-null)
  - [Trier avec ORDER BY](#trier-avec-order-by)
  - [Utiliser DISTINCT](#utiliser-distinct)
  - [Utiliser LIMIT et OFFSET](#utiliser-limit-et-offset)

- [Liste des Dailys](#dailys)
- [Get started Mokaroo](#get-started-mokaroo)

![border](../assets/line/border_b.png)

### Tools :

- [Mokaroo](https://www.mockaroo.com/)

---

# First Steps

- Premièrement nous allons nous connecter au superUtilisateur postregreS et saisir le mot de passe demandé

`pgcli -U postgres`

- Puis nous allons créer une base de donnée

`CREATE DATABASE test_DB;`

- Ainsi notre première database est créée

##### IMPORTANT :

_En PostgreSQL, quand on crée une nouvelle base de données, **on ne peut pas simplement "changer" de base de données à l'intérieur de la même session** . PostgreSQL **exige de se reconnecter pour accéder à une autre base de données**, car **chaque session est associée à une base de données spécifique dès le départ**._

- Nous allons donc nous deconnecter avec **ctrl D**
- Puis nous reconnecter en spécifiant la database ici test_DB

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

![border](../assets/line/line_multi_point_r.png)

# Data Control Language DCL

- Le DCL est utilisé pour gérer les droits d'accès aux objets dans la base de données.

## CREATE ALTER DROP USER

#### CREATE USER

```
CREATE USER alice WITH PASSWORD 'mot_de_passe';
```

#### Modifier avec ALTER USER

```
ALTER USER alice WITH PASSWORD 'nouveau_mot_de_passe';
```

#### Supprimer avec DROP USER

```
DROP USER alice;
```

## Rôles et Utilisateurs dans PostgreSQL

### Commandes

- Pour voir les rôles il faut passer par la commande
  `\du`

-Voir les privilèges attribués à un rôle spécifique (par exemple, moderateur) :

```
SELECT grantee, privilege_type
FROM information_schema.role_table_grants
WHERE grantee = 'moderateur';
```

### Définition

On peut voir un rôle soit comme un titre
(comme "modérateur" ou "administrateur")
qui donne un ensemble de privilèges,
soit comme un utilisateur spécifique pouvant
se connecter et recevoir des privilèges directement.

#### Utilisateur :

Un rôle qui peut se connecter à la base de données. Quand on crée un utilisateur, **on crée un rôle avec l’option LOGIN.**

#### Rôle (Role) :
**Un rôle sans l’option LOGIN** agit comme un groupe qui peut être attribué à d’autres utilisateurs.

- Les rôles dans PostgreSQL **sont des entités qui peuvent recevoir des privilèges**
- Les rôles dans PostgreSQL **peuvent agir comme des utilisateurs, des groupes, ou les deux.**
- Le concept de rôle dans PostgreSQL est plus flexible que simplement un utilisateur ou un groupe.

### MILLES NUANCES DE GRANT

## Exemple Pratique CREATE

#### Étape 1 : Préparation - Créer la base de données et se connecter

- Créer une base de données appelée meodel_design :

```
CREATE DATABASE meodel_design;
```

- Puis nous allons nous deconnecter de **pgcli** afin de nous reconnecter en utilisant cette fois notre database meodel_design fraichement créé

```
helloworld> \q
Goodbye!
> pgcli -U meodel -d meodel_design
```

#### Étape 2 : Gestion des utilisateurs

##### Créer des utilisateurs avec CREATE USER

- Nous allons créer trois utilisateurs :
- franck, toto, et tata, avec des mots de passe.

```
CREATE USER franck WITH PASSWORD 'mot_de_passe_franck';
CREATE USER toto WITH PASSWORD 'mot_de_passe_toto';
CREATE USER tata WITH PASSWORD 'mot_de_passe_tata';
```

- Ces utilisateurs sont créés, mais ils n’ont pour l’instant aucun droit spécifique sur la base de données.

#### Modifier les utilisateurs avec ALTER USER

- Changeons le mot de passe de franck pour illustrer l'utilisation de ALTER USER.

```
ALTER USER franck WITH PASSWORD 'nouveau_mot_de_passe';
```

#### Supprimer des utilisateurs avec DROP USER

- Pour supprimer un utilisateur, on utilise DROP USER. Par exemple, pour supprimer tata
- (notons que cela ne fonctionnera que si l'utilisateur n'a aucun droit ou objet dépendant)

```
DROP USER tata;
```

#### Étape 3 : Utilisation des rôles PostgreSQL

##### Créer un rôle

- Créons un rôle appelé moderateur qui aura des privilèges spécifiques sur certaines tables.
- Ce rôle agira comme un groupe pour centraliser les privilèges.

```
CREATE ROLE moderateur;
```

## GRANT REVOQUE EXEMPLE

### 1. Créer un rôle sans connexion

- Pour cet exemple, disons que nous avons un rôle général, moderateur, qui a des droits sur plusieurs tables, mais ce rôle ne peut pas se connecter directement.

```
CREATE ROLE moderateur;
```

- Ce rôle peut ensuite recevoir des privilèges sur des objets de la base de données (comme des tables).

### 2. Créer un utilisateur avec l’option LOGIN

- Pour créer un utilisateur qui pourra se connecter à la base de données,
- on doit ajouter **WITH LOGIN**. Par exemple, pour créer un utilisateur allen avec un mot de passe :

```
CREATE USER allen WITH PASSWORD '1234';
```

- Cet utilisateur allen peut maintenant se connecter à la base de données, mais il n’a pour l’instant **aucun privilège particulier.**

### 3. Attribuer un rôle à un utilisateur (ou à d’autres rôles)

- Pour donner à allen les privilèges associés au rôle moderateur,
- **on utilise GRANT**. Cela signifie qu’ **allen héritera des privilèges de moderateur** :

```
GRANT moderateur TO allen;
```

- Ainsi, allen reçoit les privilèges du rôle moderateur.
- Par exemple, **si le rôle moderateur a des droits de lecture sur une table, allen héritera automatiquement de ces droits.**

### 4. Attribuer des privilèges au rôle moderateur

- Maintenant, attribuons des privilèges spécifiques au rôle moderateur,
- plutôt qu’à chaque utilisateur individuellement.
- Par exemple, **si nous avons une table employes et nous voulons que tous les modérateurs puissent lire les données :**

---

- Avec cette commande, tous les utilisateurs ayant le rôle moderateur pourront lire la table employes.

```
GRANT SELECT ON TABLE employes TO moderateur;
```

---

### 5. Vérifier les Rôles et les Privilèges

#### Vérifier les rôles :

- Pour voir les rôles et utilisateurs existants, vous pouvez utiliser cette commande dans pgcli :
- Cela liste tous les rôles, avec les permissions associées (par exemple, si le rôle a LOGIN).

`\du`

### 6. Voir les privilèges d’un rôle spécifique :

- Pour voir les privilèges du rôle moderateur sur les objets de la base de données, utilisez cette commande SQL :

- Cela nous montre les privilèges associés à moderateur sur chaque table.

```
SELECT grantee, privilege_type
FROM information_schema.role_table_grants
WHERE grantee = 'moderateur';
```

GRANT **SELECT**

```
helloworld> GRANT SELECT ON TABLE employes TO moderateur;
helloworld> SELECT grantee, privilege_type
 FROM information_schema.role_table_grants
 WHERE grantee = 'moderateur';
```

```
+------------+----------------+
| grantee    | privilege_type |
|------------+----------------|
| moderateur | SELECT         |
+------------+----------------+
```

### 7. Gestion des Privilèges avec REVOKE

- Supposons que nous souhaitons retirer le rôle moderateur d'allen :

- ici Allen est moderateur

```
\du
| allen | False | True | False | False | True | -1 | <null> | ['moderateur']
```

- Puis nous allons revoquer le role de moderateur

```
REVOKE moderateur FROM allen;
REVOKE ROLE
```

- Ainsi nous pouvons constater que moderateur à disparu

```
|allen|False|True|False|False|True|-1|<null>|[]
```

- allen ne pourra plus accéder aux privilèges liés au rôle moderateur.

---

## Gestion des droits

#### Attribuer des privilèges avec GRANT

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

![border](../assets/line/line_teal_point_l.png)

# Data Definition Language DDL

![border](../assets/line/line_multi_point_r.png)

- Pour commencer, créons une base de données nommée entreprise :

### Créer une base de données

```
CREATE DATABASE entreprise;
```

- Nous allons nous connecter à la db avec

```
psql -U votre_utilisateur -d entreprise
```

### Créer une base de données

- Nous allons créer une table employes avec les colonnes suivantes : id, prenom, nom, departement, salaire, et date_embauche.

```
CREATE TABLE employes (
    id SERIAL PRIMARY KEY,
    prenom VARCHAR(50),
    nom VARCHAR(50),
    departement VARCHAR(50),
    salaire DECIMAL(10, 2),
    date_embauche DATE
);
```

## Créer un index

- Pour optimiser les recherches sur la colonne departement, nous pouvons créer un index :

```
CREATE INDEX idx_departement ON employes(departement);
```

## Modification d'une table avec ALTER

#### Ajouter une colonne

- Ajoutons une colonne email à la table employes :

```
ALTER TABLE employes
ADD COLUMN email VARCHAR(100);
```

## Modifier une colonne

- Modifions la longueur de la colonne departement pour autoriser 100 caractères :

```
ALTER TABLE employes
ALTER COLUMN departement TYPE VARCHAR(100);
```

## Supprimer une colonne

- Supposons que nous n'avons plus besoin de la colonne email. Voici comment la supprimer :

```
ALTER TABLE employes
DROP COLUMN email;
```

## Supprimer et tronquer des tables

#### Utiliser DROP pour supprimer une table

- La commande DROP supprime une table et toutes les données qu'elle contient de façon définitive :

```
DROP TABLE employes;
```

#### Utiliser TRUNCATE pour vider une table

- TRUNCATE supprime toutes les lignes d'une table, mais conserve la structure de la table :

```
TRUNCATE TABLE employes;
```

## Contraintes PK FK unique not null default check

Les contraintes définissent des règles que les données doivent respecter.

### PRIMARY KEY

- La clé primaire identifie de manière unique chaque ligne d'une table. Dans notre exemple, la colonne id est définie comme clé primaire.

```
CREATE TABLE employes (
    id SERIAL PRIMARY KEY,
    prenom VARCHAR(50),
    nom VARCHAR(50),
    departement VARCHAR(50),
    salaire DECIMAL(10, 2),
    date_embauche DATE
);
```

### FOREIGN KEY

Créons une table departements et définissons une contrainte de clé étrangère pour lier les employés aux départements.

```
CREATE TABLE departements (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) UNIQUE
);

ALTER TABLE employes
ADD COLUMN departement_id INT,
ADD CONSTRAINT fk_departement FOREIGN KEY (departement_id) REFERENCES departements(id);
```

### UNIQUE

- La contrainte UNIQUE empêche les valeurs dupliquées dans une colonne spécifique. Par exemple :

```
ALTER TABLE employes
ADD CONSTRAINT unique_email UNIQUE (email);
```

### NOT NULL

```
ALTER TABLE employes
ALTER COLUMN nom SET NOT NULL;
```

### DEFAULT

- DEFAULT définit une valeur par défaut pour une colonne lorsque rien n'est spécifié :

```
ALTER TABLE employes
ALTER COLUMN salaire SET DEFAULT 30000;
```

### CHECK

- CHECK impose une condition que chaque ligne doit respecter. Par exemple, pour s’assurer que le salaire est toujours positif :

```
ALTER TABLE employes
ADD CONSTRAINT check_salaire CHECK (salaire > 0);
```

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

![border](../assets/line/line_teal_point_l.png)

# Manipulation des données avec DML

![border](../assets/line/line_multi_point_r.png)

### INSERT INTO

```
INSERT INTO table_test (prenom, nom, email, age, adresse, telephone)
VALUES ('Alice', 'Dupont', 'alice@example.com', 25, '123 Rue Principale', '0123456789');
```

### Insertions multiples

```
INSERT INTO table_test (prenom, nom, email, age, adresse, telephone)
VALUES
('Bob', 'Martin', 'bob@example.com', 30, '456 Rue Secondaire', '0987654321'),
('Charlie', 'Durand', 'charlie@example.com', 22, '789 Rue Tertiaire', '0192837465');
```

### Vérification des données insérées

`SELECT * FROM table_test;`

## GRANT

##### VOIR LES PRIVILÈGES

`\dp mockaroo_tes`

##### ACCORDER DES PRIVILEGES (pour Franck):

- Pour attribuer des privilèges, on utilise GRANT en spécifiant le **type de droit** ( SELECT, INSERT, UPDATE, etc.), **la cible** (base de données, table ou colonne), **et l’utilisateur.**

- Supposons que nous voulons donner à Franck certains privilèges sur la table mockaroo_test :

- **Creation de l'user Franck**

```
CREATE USER franck WITH PASSWORD 'votre_mot_de_passe';
CREATE ROLE
```

- Ensuite nous allons accorder des privilèges à Franck sur la table mockaroo_test TO franck

- **Le droit de lecture pour Franck :**

```
GRANT SELECT ON TABLE mockaroo_test TO franck;
```

- **Puis le droit d'inserer des données pour Franck :**

```
GRANT INSERT ON TABLE mockaroo_test TO franck;
```

- Rappel du nom des colonnes **\d mockaroo_test**

```
+--------+-----------------------+-----------+
| Column | Type                  | Modifiers |
|--------+-----------------------+-----------|
| id     | integer               |           |
| prenom | character varying(50) |           |
| nom    | character varying(50) |           |
| email  | character varying(50) |           |
+--------+-----------------------+-----------+
```

- **Puis le droit de mise à jour (UPDATE) uniquement pour la colonne prenom (toujours TO Franck ^^) :**

```
GRANT UPDATE (prenom) ON TABLE mockaroo_test TO franck;
```

##### REVOQUER LES PRIVILEGES (pour Franck):

- Retirer le droit de lecture (SELECT) :

```
REVOKE SELECT ON TABLE mockaroo_test FROM franck;
```

- Retirer le droit de mise à jour (UPDATE) sur la colonne prenom :

```
REVOKE UPDATE (prenom) ON TABLE mockaroo_test FROM franck;

```

#### VERIFICATIONS :

- Nous allons vérifier l'exitence de l'utilisateur franck

`SELECT rolname FROM pg_roles WHERE rolname = 'franck';`

```
+---------+
| rolname |
|---------|
| franck  |
+---------+
SELECT 1

```

- Puis nous allons vérifier les privilèges de franck **sur la table mockaroo_test**

```
SELECT grantee, privilege_type
FROM information_schema.role_table_grants
WHERE table_name = 'mockaroo_test' AND grantee = 'franck';
```

- Ce qui nous donnera quelque chose de semblable à

```
+---------+----------------+
| grantee | privilege_type |
|---------+----------------|
| franck  | INSERT         |
| franck  | SELECT         |
+---------+----------------+
```

- Je remarque que L'update prenom n'est pas visible

```
SELECT grantee, table_name, column_name, privilege_type
FROM information_schema.column_privileges
WHERE table_name = 'mockaroo_test' AND grantee = 'franck';
```

- Ce qui nous donne un schema du type :

```
+---------+---------------+-------------+----------------+
| grantee | table_name    | column_name | privilege_type |
|---------+---------------+-------------+----------------|
| franck  | mockaroo_test | prenom      | UPDATE         |
| franck  | mockaroo_test | prenom      | SELECT         |
| franck  | mockaroo_test | nom         | SELECT         |
| franck  | mockaroo_test | id          | INSERT         |
| franck  | mockaroo_test | prenom      | INSERT         |
| franck  | mockaroo_test | id          | SELECT         |
| franck  | mockaroo_test | nom         | INSERT         |
| franck  | mockaroo_test | email       | INSERT         |
| franck  | mockaroo_test | email       | SELECT         |
+---------+---------------+-------------+----------------+
```

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

# Data Query Language DQL

## Structure d'une requête SELECT

- Pour ce daily je vais créer une table employes que je vais remplir avec un insert aléatoire

```
CREATE TABLE employes (
    id SERIAL PRIMARY KEY,
    prenom VARCHAR(50),
    nom VARCHAR(50),
    departement VARCHAR(50),
    salaire DECIMAL(10, 2),
    date_embauche DATE
);

INSERT INTO employes (prenom, nom, departement, salaire, date_embauche) VALUES
('Alice', 'Martin', 'Ventes', 50000, '2021-06-15'),
('Bob', 'Dupont', 'IT', 60000, '2019-03-10'),
('Claire', 'Leclerc', 'RH', 55000, '2020-10-22'),
('David', 'Garcia', 'IT', 62000, '2018-04-02'),
('Emma', 'Bernard', 'Ventes', 52000, '2022-01-18');
```

#### REQUETE SELECT DE BASE

```
SELECT * FROM employes;
```

#### REQUETE SELECT SPECIFIQUE

- Nous pouvons sélectionner seulement certaines colonnes afin de les afficher en les spécifiant après SELECT :

- **Ne pas oublier la virgule quand plusieurs select**

```
SELECT prenom, nom FROM employes;
```

#### Alias as PRENOM

- Les alias permettent de renommer les colonnes dans le résultat. Ici, nous renommerons prenom en Prénom et nom en Nom :

- Renommer avec des alias est temporaire et ne s’applique qu’à l'affichage du résultat de la requête.

```
SELECT prenom AS Prénom, nom AS Nom FROM employes;
```

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

## 2.Filtrage des Données

#### WHERE

- La clause WHERE permet de filtrer les résultats selon des critères spécifiques. Par exemple, pour trouver les employés du département "IT" :

```
SELECT * FROM employes WHERE departement = 'IT';
```

```
+----+--------+--------+-------------+----------+---------------+
| id | prenom | nom    | departement | salaire  | date_embauche |
|----+--------+--------+-------------+----------+---------------|
| 2  | Bob    | Dupont | IT          | 60000.00 | 2019-03-10    |
| 4  | David  | Garcia | IT          | 62000.00 | 2018-04-02    |
+----+--------+--------+-------------+----------+---------------+
```

#### Opérateurs de Comparaison WHERE

- Les opérateurs de comparaison **(=, <>, >, <, >=, <=)** permettent de créer des conditions. Par exemple, pour trouver les employés dont le salaire est supérieur à 55000

```
SELECT * FROM employes WHERE salaire > 55000;
```

```
+----+--------+--------+-------------+----------+---------------+
| id | prenom | nom    | departement | salaire  | date_embauche |
|----+--------+--------+-------------+----------+---------------|
| 2  | Bob    | Dupont | IT          | 60000.00 | 2019-03-10    |
| 4  | David  | Garcia | IT          | 62000.00 | 2018-04-02    |
+----+--------+--------+-------------+----------+---------------+
```

#### Les Opérateurs Logiques AND OR NOT

- Les opérateurs logiques **(AND, OR, NOT)** permettent de combiner plusieurs conditions :

- Trouver les employés du département IT avec un salaire supérieur à 60000 :

```
SELECT * FROM employes WHERE departement = 'IT' AND salaire > 60000;
```

```
+----+--------+--------+-------------+----------+---------------+
| id | prenom | nom    | departement | salaire  | date_embauche |
|----+--------+--------+-------------+----------+---------------|
| 4  | David  | Garcia | IT          | 62000.00 | 2018-04-02    |
+----+--------+--------+-------------+----------+---------------+
```

- Trouver les employés dans Ventes ou RH :

```
SELECT * FROM employes WHERE departement = 'Ventes' OR departement = 'RH';
```

```
+----+--------+---------+-------------+----------+---------------+
| id | prenom | nom     | departement | salaire  | date_embauche |
|----+--------+---------+-------------+----------+---------------|
| 1  | Alice  | Martin  | Ventes      | 50000.00 | 2021-06-15    |
| 3  | Claire | Leclerc | RH          | 55000.00 | 2020-10-22    |
| 5  | Emma   | Bernard | Ventes      | 52000.00 | 2022-01-18    |
+----+--------+---------+-------------+----------+---------------+

```

#### WHERE BETWEEN

- BETWEEN permet de filtrer les résultats dans une plage de valeurs:

```
SELECT * FROM employes WHERE salaire BETWEEN 50000 AND 60000;
```

```
+----+--------+---------+-------------+----------+---------------+
| id | prenom | nom     | departement | salaire  | date_embauche |
|----+--------+---------+-------------+----------+---------------|
| 1  | Alice  | Martin  | Ventes      | 50000.00 | 2021-06-15    |
| 2  | Bob    | Dupont  | IT          | 60000.00 | 2019-03-10    |
| 3  | Claire | Leclerc | RH          | 55000.00 | 2020-10-22    |
| 5  | Emma   | Bernard | Ventes      | 52000.00 | 2022-01-18    |
+----+--------+---------+-------------+----------+---------------+
```

#### WHERE IN

- IN permet de filtrer selon une liste de valeurs. Par exemple, pour trouver les employés dans les départements IT et RH :

```
SELECT * FROM employes WHERE departement IN ('IT', 'RH');
```

```
+----+--------+---------+-------------+----------+---------------+
| id | prenom | nom     | departement | salaire  | date_embauche |
|----+--------+---------+-------------+----------+---------------|
| 2  | Bob    | Dupont  | IT          | 60000.00 | 2019-03-10    |
| 3  | Claire | Leclerc | RH          | 55000.00 | 2020-10-22    |
| 4  | David  | Garcia  | IT          | 62000.00 | 2018-04-02    |
+----+--------+---------+-------------+----------+---------------+
```

#### LIKE et les caractères génériques wildcards

- LIKE permet de faire des recherches partielles avec les wildcards **(% pour plusieurs caractères et \_ pour un seul caractère).**

- Trouver les employés dont le prénom **commence par A**:

```
SELECT * FROM employes WHERE prenom LIKE 'A%';
```

```
+----+--------+--------+-------------+----------+---------------+
| id | prenom | nom    | departement | salaire  | date_embauche |
|----+--------+--------+-------------+----------+---------------|
| 1  | Alice  | Martin | Ventes      | 50000.00 | 2021-06-15    |
+----+--------+--------+-------------+----------+---------------+
```

- Trouver les employés dont le nom **contient ar** :

```
SELECT * FROM employes WHERE nom LIKE '%ar%';
```

```
+----+--------+---------+-------------+----------+---------------+
| id | prenom | nom     | departement | salaire  | date_embauche |
|----+--------+---------+-------------+----------+---------------|
| 1  | Alice  | Martin  | Ventes      | 50000.00 | 2021-06-15    |
| 4  | David  | Garcia  | IT          | 62000.00 | 2018-04-02    |
| 5  | Emma   | Bernard | Ventes      | 52000.00 | 2022-01-18    |
+----+--------+---------+-------------+----------+---------------+
```

#### Gérer les NULL

- Pour tester si une colonne est NULL, on utilise IS NULL ou IS NOT NULL :

```
SELECT * FROM employes WHERE salaire IS NOT NULL;
```

```
+----+--------+---------+-------------+----------+---------------+
| id | prenom | nom     | departement | salaire  | date_embauche |
|----+--------+---------+-------------+----------+---------------|
| 1  | Alice  | Martin  | Ventes      | 50000.00 | 2021-06-15    |
| 2  | Bob    | Dupont  | IT          | 60000.00 | 2019-03-10    |
| 3  | Claire | Leclerc | RH          | 55000.00 | 2020-10-22    |
| 4  | David  | Garcia  | IT          | 62000.00 | 2018-04-02    |
| 5  | Emma   | Bernard | Ventes      | 52000.00 | 2022-01-18    |
+----+--------+---------+-------------+----------+---------------+
```

- en revanche comme tout le monde possède un salaire :

```
helloworld> SELECT * FROM employes WHERE salaire IS NULL;
```

```
+----+--------+-----+-------------+---------+---------------+
| id | prenom | nom | departement | salaire | date_embauche |
|----+--------+-----+-------------+---------+---------------|
+----+--------+-----+-------------+---------+---------------+

```

![postegrean](/assets/img/border/cadre_white_b.png)

## 3.Organisation des résultats

### Trier avec ORDER BY

- ORDER BY permet de trier les résultats par une ou plusieurs colonnes

```
SELECT * FROM employes ORDER BY salaire ASC;
```

```
+----+--------+---------+-------------+----------+---------------+
| id | prenom | nom     | departement | salaire  | date_embauche |
|----+--------+---------+-------------+----------+---------------|
| 1  | Alice  | Martin  | Ventes      | 50000.00 | 2021-06-15    |
| 5  | Emma   | Bernard | Ventes      | 52000.00 | 2022-01-18    |
| 3  | Claire | Leclerc | RH          | 55000.00 | 2020-10-22    |
| 2  | Bob    | Dupont  | IT          | 60000.00 | 2019-03-10    |
| 4  | David  | Garcia  | IT          | 62000.00 | 2018-04-02    |
+----+--------+---------+-------------+----------+---------------+
```

Trier par date d'embauche décroissante :

```
SELECT * FROM employes ORDER BY date_embauche DESC;
```

```
+----+--------+---------+-------------+----------+---------------+
| id | prenom | nom     | departement | salaire  | date_embauche |
|----+--------+---------+-------------+----------+---------------|
| 5  | Emma   | Bernard | Ventes      | 52000.00 | 2022-01-18    |
| 1  | Alice  | Martin  | Ventes      | 50000.00 | 2021-06-15    |
| 3  | Claire | Leclerc | RH          | 55000.00 | 2020-10-22    |
| 2  | Bob    | Dupont  | IT          | 60000.00 | 2019-03-10    |
| 4  | David  | Garcia  | IT          | 62000.00 | 2018-04-02    |
+----+--------+---------+-------------+----------+---------------+
```

### Tri multi-colonnes

- On peut trier sur plusieurs colonnes. Par exemple, pour trier d'abord par département puis par salaire :

- ORDER BY commence par trier les résultats selon la colonne departement par ordre alphabétique croissant puis le tri se fait par le le salaire en focntion du montant

```
SELECT * FROM employes ORDER BY departement, salaire DESC;
```

```
+----+--------+---------+-------------+----------+---------------+
| id | prenom | nom     | departement | salaire  | date_embauche |
|----+--------+---------+-------------+----------+---------------|
| 4  | David  | Garcia  | IT          | 62000.00 | 2018-04-02    |
| 2  | Bob    | Dupont  | IT          | 60000.00 | 2019-03-10    |
| 3  | Claire | Leclerc | RH          | 55000.00 | 2020-10-22    |
| 5  | Emma   | Bernard | Ventes      | 52000.00 | 2022-01-18    |
| 1  | Alice  | Martin  | Ventes      | 50000.00 | 2021-06-15    |
+----+--------+---------+-------------+----------+---------------+
```

### Utiliser DISTINCT

DISTINCT permet d’éliminer les doublons. Par exemple, pour obtenir les différents départements sans répétition :

```
SELECT DISTINCT departement FROM employes;
```

```
+-------------+
| departement |
|-------------|
| Ventes      |
| RH          |
| IT          |
```

### Utiliser LIMIT et OFFSET

- Limiter les résultats à 3 lignes :

```
SELECT * FROM employes LIMIT 3;
```

```
+----+--------+---------+-------------+----------+---------------+
| id | prenom | nom     | departement | salaire  | date_embauche |
|----+--------+---------+-------------+----------+---------------|
| 1  | Alice  | Martin  | Ventes      | 50000.00 | 2021-06-15    |
| 2  | Bob    | Dupont  | IT          | 60000.00 | 2019-03-10    |
| 3  | Claire | Leclerc | RH          | 55000.00 | 2020-10-22    |
+----+--------+---------+-------------+----------+---------------+
```

- Déplacer le point de départ des résultats avec OFFSET (par exemple, ignorer les 2 premières lignes) :

```
SELECT * FROM employes LIMIT 3 OFFSET 2;
```

```
+----+--------+---------+-------------+----------+---------------+
| id | prenom | nom     | departement | salaire  | date_embauche |
|----+--------+---------+-------------+----------+---------------|
| 3  | Claire | Leclerc | RH          | 55000.00 | 2020-10-22    |
| 4  | David  | Garcia  | IT          | 62000.00 | 2018-04-02    |
| 5  | Emma   | Bernard | Ventes      | 52000.00 | 2022-01-18    |
+----+--------+---------+-------------+----------+---------------+
```

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

---

## Data Definition Language (DDL) (v2)

#### Création d'éléments avec CREATE

- Dans un premier temps nous allons créer notre base de données

```
CREATE DATABASE entreprise;
```

---

# Dailys

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

## Mercredi 30/10/2024 :

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

### Introduction à PostgreSQL et DCL :

- [x] Découverte de PostgreSQL

  - [x] Identifier les différences entre MySQL et PostgreSQL
  - [x] Savoir Expliquer les avantages de PostgreSQL
  - [x] Savoir Choisir les cas d'usage adaptés à PostgreSQL

- [x] Installation et Configuration

  - [x] Installation de PostgreSQL sur la machine
  - [x] Installation de pgAdmin 4
  - [x] Installation de pgcli
  - [x] Configuration initiale
    - [x] Ports
    - [x] Mot de passe postgres
    - [x] Création du premier utilisateur
  - [x] Test de la connexion

- [x] Data Control Language (DCL)

  - [x] Gestion des utilisateurs

    - [x] Savoir construire des requêtes CREATE USER
    - [x] Savoir modifier des utilisateurs avec ALTER USER
    - [x] Savoir supprimer des utilisateurs avec DROP USER
    - [x] Savoir utiliser les rôles PostgreSQL

  - [x] Gestion des droits

    - [x] Savoir attribuer des privilèges avec GRANT
      - [x] Droits sur les bases de données
      - [x] Droits sur les tables
      - [x] Droits sur les colonnes
    - [x] Gérer la révocation avec REVOKE
      - [x] Comment retirer des droits sur une base de données, une table ou une colonne ?
      - [x] Quel est l'impact d'une révocation en cascade ?

  - [x] Les bonnes pratiques de sécurité
    - [x] Comment appliquer le principe du moindre privilège dans PostgreSQL ?
    - [ ] Quand utiliser des rôles plutôt que des utilisateurs individuels ?
    - [ ] Comment auditer efficacement les droits d'accès ?

## Jeudi 31/10/2024 :

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

### SQL - DDL et DML

- [x] Data Definition Language (DDL)

  - [x] Savoir créer avec CREATE
    - [x] Base de données
    - [x] Table
    - [x] Index
  - [x] Savoir modifier avec ALTER
    - [x] Savoir ajouter une colonne
    - [x] Savoir modifier une colonne
    - [x] Savoir supprimer une colonne
  - [x] Savoir utiliser DROP et TRUNCATE
  - [x] Savoir définir les contraintes
    - [x] PRIMARY KEY
    - [x] FOREIGN KEY
    - [x] UNIQUE
    - [x] NOT NULL
    - [x] DEFAULT
    - [x] CHECK

- #### Data Manipulation Language (DML)

  - [x] Savoir insérer des données avec INSERT
    - [x] Insertion simple
    - [x] Insertion multiple
    - [x] Insertion avec SELECT
  - [x] Savoir mettre à jour avec UPDATE
    - [x] Mise à jour simple
    - [x] Mise à jour conditionnelle
  - [x] Savoir supprimer avec DELETE
    - [x] Suppression simple
    - [x] Suppression conditionnelle
    - [ ] Différence avec TRUNCATE

- [x] Exercices pratiques

  - [x] Création d'une base de données complète
  - [x] Manipulation des données

## Lundi 04/11/2024 :

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

### SQL - Data Query Language (DQL)

- [x] Structure d'une requête SELECT

  - [x] Savoir écrire une requête SELECT de base
  - [x] Savoir sélectionner des colonnes spécifiques
  - [x] Savoir utiliser les alias avec AS
  - [x] Savoir utiliser la sélection complète (\*)

- [x] Filtrage des données

  - [x] Savoir utiliser la clause WHERE
    - [x] Savoir utiliser les opérateurs de comparaison
    - [x] Savoir utiliser les opérateurs logiques
    - [x] Savoir utiliser BETWEEN
    - [x] Savoir utiliser IN
    - [x] Savoir utiliser LIKE et ses wildcards
    - [x] Savoir gérer les NULL

- [x] Organisation des résultats

  - [x] Savoir trier avec ORDER BY

    - [x] ASC / DESC
    - [x] Tri multi-colonnes

  - [x] Savoir utiliser DISTINCT
  - [x] Savoir utiliser LIMIT et OFFSET

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

# Get started Mokaroo

- Pour installer une base de donnée avec Mockaroo il faut créer notre base de donnée sur le site , choisir SQL en export puis **construire notre BDD**

- Puis dans **pgcli** nous allons ajouter après **\i** la route correspondant à notre fichier

`\i /home/meodel/Téléchargements/mockaroo_test.sql`

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>
<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

![border](../assets/line/border_r.png)
