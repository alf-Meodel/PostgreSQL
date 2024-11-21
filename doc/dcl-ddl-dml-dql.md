<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# Bonnes Pratiques

![border](../assets/line/border_r.png)

## Sommaire

- [ DCL, DDL, DML,DQL](#dclddldmldql)
  - [DCL, Data Control Language](#data-control-language--gestion-des-permissions)
  - [DDL, Data Definition Language](#data-definition-language--définition-de-la-structure-de-la-base)
  - [DML, Data Manipulation Language](#data-manipulation-language--manipulation-des-données)
  - [DQL, Data Query Language](#data-query-language--interrogation-des-données)

![border](../assets/line/border_b.png)

# DCL,DDL,DML,DQL

![border](../assets/line/line_teal_point_r.png)

# (Data Control Language) : Gestion des permissions

Utilisé pour contrôler les droits d'accès aux données en PostgreSQL.
Exemples de commandes :

- **GRANT :** Donne des permissions aux utilisateurs (ex. GRANT SELECT ON table TO utilisateur;).
- **REVOKE :** Retire des permissions aux utilisateurs (ex. REVOKE SELECT ON table FROM utilisateur;).

<a href="#sommaire"> <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

# (Data Definition Language) : Définition de la structure de la base

Gère la création, modification et suppression des objets de la base de données (tables, index, etc.).
Exemples de commandes :

- **CREATE TABLE :** Crée une table.
- **ALTER TABLE :** Modifie la structure d’une table.
- **DROP TABLE :** Supprime une table.

<a href="#sommaire"> <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

# (Data Manipulation Language) : Manipulation des données

Permet d’ajouter, modifier et supprimer les données dans les tables.
Exemples de commandes :

- **INSERT :** Ajoute des données.
- **UPDATE :** Modifie des données existantes.
- **DELETE :** Supprime des données.
- **?MERGE:** Pas dans toutes les BDD

<a href="#sommaire"> <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

# (Data Query Language) : Interrogation des données

- Utilisé pour interroger et récupérer des données sans les modifier.
  Exemples de commande :

- **SELECT :** Extrait des données (ex. SELECT \* FROM table;).
  Chacune de ces catégories permet de gérer PostgreSQL de manière structurée : DCL pour les permissions, DDL pour la structure, DML pour les données, et DQL pour les requêtes.

![border](../assets/line/line_teal_point_l.png)

<a href="#sommaire"> <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>
<a href="../README.md">
<img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

![border](../assets/line/border_r.png)
