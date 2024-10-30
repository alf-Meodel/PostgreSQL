<h1 style="color: #008080;">GET STARTED </h1>

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

# Rôles

#### Bonnes pratiques

Pour une bonne gestion des rôles dans PostgreSQL, il faut mieux créer des **rôles basés sur les responsabilités** (ex. `role_read_only`, `role_data_entry`) puis leur attribuer des permissions adaptées. ensuite nous allons créer des utilisateurs afin de leur assigner uniquement les rôles nécessaires, sans leur donner directement de permissions. Cette approche renforce la sécurité, simplifie la gestion et permet d'ajuster facilement les accès. Séparez les rôles d’administration et d’application pour un meilleur contrôle.
