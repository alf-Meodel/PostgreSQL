<h1 style="color: #008080;">GET STARTED </h1>

![postegrean](/PostgreSQL/assets/structure/test_line_b1.png)

![postegrean](/PostgreSQL/assets/img/border/cadre_multi_t.png)

## Sommaire

- [First Steps](#first-steps)
- [Les Databases](#les_databases)
- [Généralités sur les Tables](#les_tables)
  - [Ajouter une COLUMN](#ajouter-une-column)
  - [Modifier une COLUMN](#modifier-une-column)
  - [Supprimer une COLUMN](#supprimer-une-column)
  - [Gerer une table](#gerer-une-table)
- [Mokaroo](#get-started-mokaroo)
- [Application des Dailys :](#dailys)

  - [Drop and Truncate](#utiliser-drop-&-truncate)
  - [Manipulation des données avec DML](#manipulation-des-données-avec-dml)
  - [Creation d une Database](#creation-d-une-database)
  - [Creation d'une Table Type ](#creation-d-une-table-type)
  - [Grant / Accorder](#grant)

- [Liste des Dailys](#dailys)

![postegrean](/PostgreSQL/assets/img/border/cadre_white_b.png)

![postegrean](/PostgreSQL/assets/img/line/pink_point_line_l.png)

<a href="/PostgreSQL/README.md">
  <img src="/PostgreSQL/assets/img/button/home_page.png" alt="Lire la suite" style="width: 150px; height: auto;">
</a>

![postegrean](/PostgreSQL/assets/img/line/pink_point_line_r.png)

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
  <img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
</a>

### Les Datases

- à partir de pgcli nous pouvons afficher les databases en effectuant la commande `\l`
- ce qui va afficher les databases présentes dans notre système sous la forme suivante

```
+------------------+----------+----------+-----------------------+-----------------------+
| Name             | Owner    | Encoding | Collate               | Ctype                 |
|------------------+----------+----------+-----------------------+-----------------------|
| postgres         | postgres | UTF8     | en_US.UTF-8           | en_US.UTF-8           |
| mon_database     | meodel   | UTF8     | en_US.UTF-8           | en_US.UTF-8           |
| template0        | postgres | UTF8     | en_US.UTF-8           | en_US.UTF-8           |
| template1        | postgres | UTF8     | en_US.UTF-8           | en_US.UTF-8           |
+------------------+----------+----------+-----------------------+-----------------------+
```

- Si nous désirons changer de database nous allons devoir quitter **pgcli** avec **l'antislash q** `\q`

- Puis à partir de la nous allons nous connecter à la database de notre choix

`pgcli -U postgres -d nouvelle_database`

<a href="#sommaire">
  <img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
</a>

<!-- Les tables  -->
<h3 style="color: #AB638C;" id="les_tables">Généralités sur les Tables</h3>

#### Créer une table

- Voici comment nous créons une table

```
CREATE TABLE utilisateurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    age INT,
    email VARCHAR(100)
);
```

#### Consulter les tables

- Ensuite nous allons vérifier que la table à été correctement ajouté avec **\ dt**

- ce qui nous donne une résultat dans le style suivant en affichant toutes les tables :

```+--------+--------------+-------+--------+
| Schema | Name         | Type  | Owner  |
|--------+--------------+-------+--------|
| public | nom_table    | table | meodel |
| public | toto | table | meodel |
+--------+--------------+-------+--------+
SELECT 2
```

#### Modifier une table

###### Ajouter une COLUMN

`ALTER TABLE toto ADD COLUMN description TEXT;`

`ALTER TABLE toto ADD COLUMN adresse VARCHAR(100);`

- Cela nous indique que nous effectuons une action "destructrice / irréversible", que nous validons

```
You're about to run a destructive command.
Do you want to proceed? [y/N]:
```

###### Modifier une COLUMN

- Nous pouvons modifier une colonne existante pour changer son type de données ou ses contraintes _(comme NOT NULL)_.

**Exemple :** Modifier la colonne age pour qu’elle accepte uniquement des valeurs positives (en ajoutant une contrainte CHECK) :

```
ALTER TABLE toto
ALTER COLUMN age SET DATA TYPE INT,
ADD CONSTRAINT positive_age CHECK (age > 0);
```

###### Supprimer une COLUMN

- Pour supprimer une colonne de la table toto, utilisez DROP COLUMN.

```
ALTER TABLE toto
DROP COLUMN description;
```

#### Consulter la structure d'une table

- Pour ce faire nous allons utiliser **\d toto** afin de consulter la description de la table toto

```
+-------------+------------------------+----------------------------------------------------+
| Column      | Type                   | Modifiers                                          |
|-------------+------------------------+----------------------------------------------------|
| id          | integer                |  not null default nextval('toto_id_seq'::regclass) |
| nom         | character varying(50)  |                                                    |
| age         | integer                |                                                    |
| email       | character varying(100) |                                                    |
| description | text                   |                                                    |
+-------------+------------------------+----------------------------------------------------+
```

#### Insérer des données

- Pour ajouter manuelement des données **dans la table toto** nous allons faire

```
helloworld> INSERT INTO toto (nom,age, email, description) VALUES ('Toto', 30, '
 toto@gmail.com', 'Nouveau client');
INSERT 0 1

```

#### Afficher les données d'une table

- Pour afficher les données d'une table nous allons faire

` SELECT * FROM toto;`

<a href="#sommaire">
  <img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
</a>

# Creation d'un index

#### Tips

_Quand nous créons une clé pirmaire un index est automatiquement créé_

_Les index optimisent les recherches en accédant rapidement aux données. Dans notre exemple, PostgreSQL utilise automatiquement idx_email pour accélérer les requêtes sur email dans la table toto._

- Création de l'index : Lorsqu’on crée un index (par exemple, idx_email sur la colonne email), PostgreSQL crée une structure de données interne qui rend les recherches sur cette colonne beaucoup plus rapides.

`CREATE INDEX idx_email ON toto (email);`

- Utilisation automatique de l'index : Lorsque vous exécutez une requête qui implique une condition sur la colonne email, PostgreSQL examine si l'index idx_email peut optimiser cette requête. Si c'est le cas, PostgreSQL utilise automatiquement cet index pour accélérer la recherche.

`SELECT * FROM toto WHERE email = 'toto@gmail.com';`

- Dans ce cas, PostgreSQL voit que email est indexé avec idx_email. Si l'index est pertinent pour cette recherche, il est automatiquement utilisé pour trouver les lignes correspondantes plus rapidement.

- Plan d’exécution (pour vérifier) : Si vous souhaitez voir comment PostgreSQL exécute la requête, utilisez EXPLAIN pour obtenir un aperçu du plan d’exécution. Cela vous indiquera si PostgreSQL utilise l'index ou non :

`EXPLAIN SELECT * FROM toto WHERE email = 'toto@gmail.com';`

- Si PostgreSQL utilise l’index, le plan de requête affichera Index Scan (ou un terme similaire), montrant que l'index a été pris en compte pour optimiser la requête.

<a href="#sommaire">
  <img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
</a>

# Rôles

#### Bonnes pratiques

Pour une bonne gestion des rôles dans PostgreSQL, il faut mieux créer des **rôles basés sur les responsabilités** (ex. `role_read_only`, `role_data_entry`) puis leur attribuer des permissions adaptées. ensuite nous allons créer des utilisateurs afin de leur assigner uniquement les rôles nécessaires, sans leur donner directement de permissions. Cette approche renforce la sécurité, simplifie la gestion et permet d'ajuster facilement les accès. Séparez les rôles d’administration et d’application pour un meilleur contrôle.

<a href="#sommaire">
  <img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
</a>

# GERER UNE TABLE

### Creation d'une table table_test

```
    CREATE TABLE table_test (
    id SERIAL PRIMARY KEY,
    prenom VARCHAR(50),
    nom VARCHAR(50),
    email VARCHAR(100),
    age INTEGER,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
```

### AJOUTER UNE COLONNE DANS table_test

`ALTER TABLE table_test ADD COLUMN adresse VARCHAR(100); `

### MODIFIER LA LONGUEUR DE la COLUMN EMAIL

`ALTER TABLE table_test ALTER COLUMN email TYPE VARCHAR(150);`

### Ajouter une colonne telephone avec une contrainte NOT NULL

`ALTER TABLE table_test ADD COLUMN telephone VARCHAR(15) NOT NULL;`

### Supprimer la colonne age

`ALTER TABLE table_test DROP COLUMN age;`

# Utiliser DROP & TRUNCATE

## DROP

`TRUNCATE TABLE table_test;`

Après ca nous constatons que noter table est vide

helloworld> SELECT \* FROM table_test
+----+--------+-----+-------+---------------+---------+
| id | prenom | nom | email | date_creation | adresse |
|----+--------+-----+-------+---------------+---------|
+----+--------+-----+-------+---------------+---------+
SELECT 0
Time: 0.005s
helloworld>

## TRUNCATE

`DROP TABLE table_test`

Supprimer la table table_test complètement (efface toute la structure et les données) :

##### Vider la table sans la supprimer

`TRUNCATE TABLE table_test;`

##### Supprimer la table_test complètement

`DROP TABLE table_test;`

# Creation d une Database

`CREATE DATABASE gestion_entreprise;`

# Creation d une Table Type

```
helloworld> CREATE TABLE table_test (
     id SERIAL PRIMARY KEY,
     prenom VARCHAR(50),
     nom VARCHAR(50),
     email VARCHAR(100),
     age INTEGER,
     date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     adresse VARCHAR(100),
     telephone VARCHAR(15)
 );
```

Puis nous allons vérifier la structure de la table

# Manipulation des données avec DML

### Insertion de données

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
  <img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
</a>

# Get started Mokaroo

- Pour installer une base de donnée avec Mockaroo il faut créer notre base de donnée sur le site , choisir SQL en export puis **construire notre BDD** 

- Puis dans **pgcli** nous allons ajouter après **\i** la route correspondant à notre fichier 

`\i /home/meodel/Téléchargements/mockaroo_test.sql`




<!-- ![postegrean](assets/img/border/cadre_white_b.png) -->

![postegrean](/PostgreSQL/assets/img/border/cadre_multi_t.png)

# Dailys

<a href="#sommaire">
<img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
</a>

## Mercredi 30/10/2024 :

<a href="#sommaire">
  <img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
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
      - [ ] Droits sur les tables
      - [ ] Droits sur les colonnes
    - [ ] Gérer la révocation avec REVOKE
      - [ ] Comment retirer des droits sur une base de données, une table ou une colonne ?
      - [ ] Quel est l'impact d'une révocation en cascade ?

  - [ ] Les bonnes pratiques de sécurité
    - [ ] Comment appliquer le principe du moindre privilège dans PostgreSQL ?
    - [ ] Quand utiliser des rôles plutôt que des utilisateurs individuels ?
    - [ ] Comment auditer efficacement les droits d'accès ?


## Jeudi 31/10/2024 :

<a href="#sommaire">
  <img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
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
  - [ ] Savoir définir les contraintes
    - [ ] PRIMARY KEY
    - [ ] FOREIGN KEY
    - [ ] UNIQUE
    - [ ] NOT NULL
    - [ ] DEFAULT
    - [ ] CHECK

- #### Data Manipulation Language (DML)

  - [ ] Savoir insérer des données avec INSERT
    - [ ] Insertion simple
    - [ ] Insertion multiple
    - [ ] Insertion avec SELECT
  - [ ] Savoir mettre à jour avec UPDATE
    - [ ] Mise à jour simple
    - [ ] Mise à jour conditionnelle
  - [ ] Savoir supprimer avec DELETE
    - [ ] Suppression simple
    - [ ] Suppression conditionnelle
    - [ ] Différence avec TRUNCATE

- [ ] Exercices pratiques

  - [ ] Création d'une base de données complète
  - [ ] Manipulation des données

## Jeudi 31/10/2024 :

<a href="#sommaire">
  <img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
</a>

### SQL - DDL et DML

- [ ] Data Definition Language (DDL)

  - [ ] Savoir créer avec CREATE
    - [ ] Base de données
    - [ ] Table
    - [ ] Index
  - [ ] Savoir modifier avec ALTER
    - [ ] Savoir ajouter une colonne
    - [ ] Savoir modifier une colonne
    - [ ] Savoir supprimer une colonne
  - [ ] Savoir utiliser DROP et TRUNCATE
  - [ ] Savoir définir les contraintes
    - [ ] PRIMARY KEY
    - [ ] FOREIGN KEY
    - [ ] UNIQUE
    - [ ] NOT NULL
    - [ ] DEFAULT
    - [ ] CHECK

- [ ] Data Manipulation Language (DML)

  - [ ] Savoir insérer des données avec INSERT
    - [ ] Insertion simple
    - [ ] Insertion multiple
    - [ ] Insertion avec SELECT
  - [ ] Savoir mettre à jour avec UPDATE
    - [ ] Mise à jour simple
    - [ ] Mise à jour conditionnelle
  - [ ] Savoir supprimer avec DELETE
    - [ ] Suppression simple
    - [ ] Suppression conditionnelle
    - [ ] Différence avec TRUNCATE

- [ ] Exercices pratiques
  - [ ] Création d'une base de données complète
  - [ ] Manipulation des données

## Lundi 04/11/2024 :

<a href="#sommaire">
  <img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
</a>

### SQL - Data Query Language (DQL)

- [ ] Structure d'une requête SELECT

  - [ ] Savoir écrire une requête SELECT de base
  - [ ] Savoir sélectionner des colonnes spécifiques
  - [ ] Savoir utiliser les alias avec AS
  - [ ] Savoir utiliser la sélection complète (\*)

- [ ] Filtrage des données

  - [ ] Savoir utiliser la clause WHERE
    - [ ] Savoir utiliser les opérateurs de comparaison
    - [ ] Savoir utiliser les opérateurs logiques
    - [ ] Savoir utiliser BETWEEN
    - [ ] Savoir utiliser IN
    - [ ] Savoir utiliser LIKE et ses wildcards
    - [ ] Savoir gérer les NULL

- [ ] Organisation des résultats

  - [ ] Savoir trier avec ORDER BY

    - [ ] ASC / DESC
    - [ ] Tri multi-colonnes

  - [ ] Savoir utiliser DISTINCT
  - [ ] Savoir utiliser LIMIT et OFFSET

<a href="#sommaire">
<img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
</a>
