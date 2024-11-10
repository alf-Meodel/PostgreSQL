<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# Bonnes Pratiques

![border](../assets/line/border_r.png)

## Sommaire

- [Interagir avec le super-utilisateur postregres](#interagir-avec-le-super-utilisateur-postregres)

  - [Non pourquoi ](#non-pourquoi)

  - [ Sécurité ](#sécurité)
  - [ Isolation des rôles](#isolation-des-rôles)
  - [ Meilleures pratiques en gestion des droits ](#meilleures-pratiques-en-gestion-des-droits)
  - [ Étapes pour créer un utilisateur dédié et sécuriser le tout ](#étapes-pour-créer-un-utilisateur-dédié-et-sécuriser-le-tout)
  - [ Attribuer des droits à cet utilisateur ](#attribuer-des-droits-à-cet-utilisateur)
  - [ Se connecter avec le nouvel utilisateur ](#se-connecter-avec-le-nouvel-utilisateur)
  - [ Révocation des droits supplémentaires de postgres ](#révocation-des-droits-supplémentaires-de-postgres)

- [ Tips ](#tips)
- [ DCL, DDL, DML,DQL](#modifier-une-column)
  - [DCL, Data Control Language](#les_databases)
  - [DDL, Data Definition Language](#les_tables)
  - [DML, Data Manipulation Language](#ajouter-une-column)
  - [DQL, Data Query Language](#modifier-une-column)

![border](../assets/line/border_b.png)

![border](../assets/line/line_pink_point_l.png)

# Interagir avec le super Utilisateur postregres

![border](../assets/line/line_teal_point_r.png)

```
PS C:\Users\franc> pgcli -U postgres -d helloworld
```

# Non pourquoi

## Sécurité

- L'utilisateur postgres est le superutilisateur par défaut, ce qui signifie qu'il a un accès complet et sans restrictions à toutes les bases de données et tous les objets dans PostgreSQL. Utiliser cet utilisateur pour des tâches courantes augmente le risque d'erreurs et de failles de sécurité.

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

## Isolation des rôles

- En créant des utilisateurs spécifiques pour différentes applications ou tâches, vous pouvez contrôler les permissions de manière plus fine et éviter que tous les utilisateurs ou processus aient un accès administratif.

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

## Meilleures pratiques en gestion des droits

- Il est toujours préférable de limiter les privilèges des utilisateurs en leur attribuant uniquement les permissions nécessaires pour accomplir leur travail.

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

## Étapes pour créer un utilisateur dédié et sécuriser le tout

- Se connecter avec postgres (ou tout autre superutilisateur) : Vous pouvez utiliser pgcli pour cette étape :

```
pgcli -U postgres -d helloworld
```

- Créer un nouvel utilisateur : Remplacez meodel par le nom d'utilisateur souhaité, et votre_mot_de_passe par un mot de passe sécurisé.

```
CREATE USER meodel WITH PASSWORD 'votre_mot_de_passe';
```

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

## Attribuer des droits à cet utilisateur

- Si cet utilisateur doit uniquement interagir avec la base de données helloworld, accordez-lui l'accès à cette base de données spécifiquement.

- Par exemple, pour donner des droits de connexion et des droits de manipulation des données (lecture/écriture) dans helloworld, exécutez :

```
GRANT CONNECT ON DATABASE helloworld TO meodel;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO meodel;
```

- Si de nouvelles tables sont créées dans le futur, vous pouvez également faire en sorte que meodel ait automatiquement les droits dessus :

```
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO meodel;
```

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

## Se connecter avec le nouvel utilisateur

Maintenant, vous pouvez vous connecter en utilisant l'utilisateur meodel plutôt que postgres :

```
pgcli -U meodel -d helloworld
```

## Révocation des droits supplémentaires de postgres

Assurez-vous de ne pas utiliser postgres pour des tâches quotidiennes, en le réservant pour des opérations administratives, telles que la création de bases de données, la gestion des rôles et la maintenance.

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

![border](../assets/line/line_pink_point_l.png)

# Performances

![border](../assets/line/line_teal_point_r.png)

- Utiliser un select étoile (\*) est moins performant que selectionner les user individuellement car on passe par un outil système avec \_ qui fait la transition

# Tips

- Dans PostgreSQL, nosu ne pouvons pas créer de base de données directement depuis **pgcli**. Il faut sortir de **pgcli** et utiliser **psql** ou le **terminal PostgreSQL** :

- En SQL, les chaînes de texte doivent être entourées de guillemets simples ('). Les guillemets doubles (") sont réservés aux noms de colonnes ou de tables.

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

![border](../assets/line/line_pink_point_l.png)

# DCL,DDL,DML,DQL

![border](../assets/line/line_teal_point_r.png)

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

![border](../assets/line/line_teal_point_l.png)

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>
<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

![border](../assets/line/border_r.png)