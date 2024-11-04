<h1 style="color: #008080;">COMMANDES CLI </h1>

![postegrean](/PostgreSQL/assets/img/border/cadre_white_b.png)

# Sommaire

- [Navigation](#navigation)
- [Base](#base)
- [Frequents](#frequents)
- [Autres commandes](#autres-commandes)
- [Config](#config)

---

<a href="/PostgreSQL/README.md">
  <img src="/PostgreSQL/assets/img/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

---

<h2 style="color: #ab638c" id="navigation">Navigation</h2>

## Base

Pour nous connecter à **postegre**, nous allons utiliser la commande suivante :

#### ------------------ `sudo -i -u postgres` ------------------

## ------------------ `psql` ------------------

Pour nous connecter à **pgCLI**, nous allons utiliser la commande suivante :

`pgcli -U votre_utilisateur -d votre_base`

## Frequents

**\l :** Lister toutes les bases de données
**\dt** : Lister toutes les tables dans la base de données active
**\d nom_table** : Afficher la description d'une table
**\d+ nom_table :** : Pour voir uniquement les colonnes et leurs types
**\q :** Quitter pgli

## Autres commandes

**\di nom_table:** Afficher les index d'une table
**\du :** lister tous les index associés à une table
**\dn :** Voir les schémas dans la base de données actuelle

## Config

**f3** : activer le multiligne

<a href="#sommaire">
  <img src="/PostgreSQL/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
</a>

---
