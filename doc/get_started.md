<h1 style="color: #008080;">GET STARTED </h1>

---

## Sommaire

- [Les Databases](#les_databases)
- [Les Tables](#les_tables)
  - [Ajouter une COLUMN](#ajouter-une-column)
  - [Modifier une COLUMN](#modifier-une-column)
  - [Supprimer une COLUMN](#supprimer-une-column)

---

[↩️ Readme](/README.md)

---

# Tools

- [Mokaroo](https://www.mockaroo.com/)

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

[Go to Top ⬆️](#sommaire)

<!-- Les Databases  -->
<h3 style="color: #AB638C;" id="les_databases">Les Databases </h1>

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

[Go to Top ⬆️](#sommaire)

<!-- Les tables  -->
<h3 style="color: #AB638C;" id="les_tables">Les Tables</h3>

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

[Go to Top ⬆️](#sommaire)

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

[Go to Top ⬆️](#sommaire)

# Rôles

#### Bonnes pratiques

Pour une bonne gestion des rôles dans PostgreSQL, il faut mieux créer des **rôles basés sur les responsabilités** (ex. `role_read_only`, `role_data_entry`) puis leur attribuer des permissions adaptées. ensuite nous allons créer des utilisateurs afin de leur assigner uniquement les rôles nécessaires, sans leur donner directement de permissions. Cette approche renforce la sécurité, simplifie la gestion et permet d'ajuster facilement les accès. Séparez les rôles d’administration et d’application pour un meilleur contrôle.

[Go to Top ⬆️](#sommaire)
