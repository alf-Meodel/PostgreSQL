<h1 style="color: #008080;">COMMANDES CLI </h1>

---

# Sommaire

- [Navigation](#navigation)
- [Création d'une table](#création-dune-table)
- [PostgreSQL](#postgre)
- [Pgcli](#pgcli)

---

[↩️ Readme](/PostgreSQL/README.md)

---

<h2 style="color: #ab638c" id="navigation">Navigation</h2>

#### Frequents

**\l :** Lister toutes les bases de données
**\dt** : Lister toutes les tables dans la base de données active
**\d nom_table** : Afficher la description d'une table
**\d+ nom_table :** : Pour voir uniquement les colonnes et leurs types
**\q :** Quitter pgli

#### Autre

**\di nom_table:** Afficher les index d'une table
**\du :** lister tous les index associés à une table
**\dn :** Voir les schémas dans la base de données actuelle

[Go to Top ⬆️](#sommaire)

---

<h2 style="color: #ab638c" id="création-dune-table">Création d'une table</h2>

Dans PostgreSQL, nous ne pouvons pas créer de base de données directement depuis **pgcli**. Il faut sortir de **pgcli** et utiliser **psql** ou le **terminal PostgreSQL** :

[Go to Top ⬆️](#sommaire)

---

<h2 style="color: #ab638c" id="postgre">PostgreSQL</h2>

- Pour nous connecter, nous allons utiliser la commande suivante :

#### ------------------ `sudo -i -u postgres` ------------------

- Ce qui nous permettra d'accéder au **Terminal PostgreSQL** avec :

## ------------------ `psql` ------------------

[Go to Top ⬆️](#sommaire)

---

<h2 style="color: #ab638c" id="pgcli">Pgcli</h2>

- Lancer **pgcli** :

`pgcli -U votre_utilisateur -d votre_base`

---

**f3** : activer le multiligne

[Go to Top ⬆️](#sommaire)
