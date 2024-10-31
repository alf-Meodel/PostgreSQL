# `GET STARTED`

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

# Les Databases

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

# Les tables

- Voici comment nous créons une table

```
CREATE TABLE utilisateurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    age INT,
    email VARCHAR(100)
);
```

- Ensuite nous allons vérifier que la table à été correctement ajouté avec **\ dt**

- ce qui nous donne une résultat dans le style suivant en affichant toutes les tables :

```+--------+--------------+-------+--------+
| Schema | Name         | Type  | Owner  |
|--------+--------------+-------+--------|
| public | nom_table    | table | meodel |
| public | utilisateurs | table | meodel |
+--------+--------------+-------+--------+
SELECT 2
```

# Rôles

#### Bonnes pratiques

Pour une bonne gestion des rôles dans PostgreSQL, il faut mieux créer des **rôles basés sur les responsabilités** (ex. `role_read_only`, `role_data_entry`) puis leur attribuer des permissions adaptées. ensuite nous allons créer des utilisateurs afin de leur assigner uniquement les rôles nécessaires, sans leur donner directement de permissions. Cette approche renforce la sécurité, simplifie la gestion et permet d'ajuster facilement les accès. Séparez les rôles d’administration et d’application pour un meilleur contrôle.
