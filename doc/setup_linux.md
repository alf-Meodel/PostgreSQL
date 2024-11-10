<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>
<h1 style="color: #008080;">LINUX POSTEGRESQL </h1>

![border](../assets/line/border_r.png)

# Sommaire

- [Setup](#setup)
  - [Premier pas](#premiers-pas)
  - [Première connexion à PostgreSQL](#premiers-pas)
  - [Mot de passe superUtilisateur postgreS](#premiers-pas)
  - [Créer un nouvel utilisateur](#premiers-pas)
  - [Quitter psql](#premiers-pas)
- [Installation de pgAdmin 4](#pgadmin4)
  - [Introduction](#premiers-pas)
  - [Installation](#premiers-pas)
  - [Premier pas](#premiers-pas)
- [Installation de pgCli](#pgcli)
  - [Creation dans psql d'une BDD](#premiers-pas)

---

---

![border](../assets/line/line_teal_point_l.png)

<h2 style="color: #ab638c" id="setup"> SETUP </h2>

![border](../assets/line/line_multi_point_r.png)

## Premiers pas

- Dans un premier temps nous allons mettre à jour nos paquets

`sudo apt update`

- Puis installer avec PostegreSQL avec la commande suivante

`sudo apt install postgresql postgresql-contrib`

- et enfin nous allosn vérifier que le système est actif avec

` sudo systemctl status postgresql`

- ce qui nous donnera quelque chsoe dans le style de :

```

postgresql.service - PostgreSQL RDBMS
     Loaded: loaded (/usr/lib/systemd/system/postgresql.service; enabled; prese>
     Active: active (exited) since Wed 2024-10-30 11:21:34 CET; 2min 30s ago
   Main PID: 11621 (code=exited, status=0/SUCCESS)
        CPU: 5ms

```

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

## Première connexion à PostgreSQL

- Pour nous connecter nous allons utiliser la commande suivante :

## ` sudo -i -u postgres`

- Ce qui nous permettra d'accéder au **Terminal PostegreSQL** avec :

# `psql`

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

## Mot de passe superUtilisateur postgreS

- Une fois dans le terminal PostgreSQL **indiqué par postgres=#** , nous allons définir un mot de passe pour **postgres** qui est le **Superutilisateur** par défaut de PostgreSQL avec la commande suivante :

`ALTER USER postgres PASSWORD 'votre_mot_de_passe';`

- **ALTER ROLE** confirme que le mot de passe à été modifié avec succès !!

## Créer un nouvel utilisateur

- Nous pouvons créer un nouvel utilisateur avec

`CREATE USER nom_utilisateur WITH PASSWORD 'mot_de_passe';`

#### Ajout des Privilèges superutilisateur

- Et lui accorder des privilèges \*_"SuperUtilisateur"_`

`ALTER USER nom_utilisateur WITH SUPERUSER;`

- Autoriser l’utilisateur à créer des bases de données :

`ALTER ROLE nom_utilisateur WITH CREATEDB;`

- Autoriser l’utilisateur à créer d'autres rôles :

`ALTER ROLE nom_utilisateur WITH CREATEROLE;`

#### Combiner tout les privilèges

`ALTER ROLE nom_utilisateur WITH SUPERUSER CREATEDB CREATEROLE;`

_PS: Si tout se déroule correctement le message **ALTER ROLE** s'affichera_

## Quitter psql

- la commande recommandé est **/q** mais elle ne marche pas dans mon cas
- j'utilise donc **ctrl D**

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

![border](../assets/line/line_teal_point_l.png)

<h1 style="color: #ab638c" id="pgadmin4"> Installation de pgAdmin 4 </h1>

![border](../assets/line/line_multi_point_r.png)

## Introduction

_pgAdmin 4 est une interface graphique complète pour administrer et gérer les bases de données PostgreSQL. Elle permet de créer, modifier et surveiller des bases de données facilement, sans ligne de commande._

## Installation

- Dans un premier temps nous allons mettre à jour nos paquets

`sudo apt update`

- Puis nous allons installer la version desktop de **pgAdmin4** avec la commande :

`sudo apt install pgadmin4-desktop `

- Ce qui nous permettra de lancer la version desktop manuellement à partir de notre bureau
- **PS : une version web existe**

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

![border](../assets/line/line_teal_point_l.png)

<h1 style="color: #ab638c" id="pgcli"> Installation de pgCli </h1>

![border](../assets/line/line_multi_point_r.png)

- Dans un premier temps nous allons mettre à jour nos paquets

`sudo apt update`

- Puis nous allons installer **pgCli** avec la commande suivante

`sudo apt install pgcli`

- à présent nous pouvons nous connecter avec nos identifiants/ mots de passe en suivant la section **se connecter à PostgreSQL**

`pgcli -U votre_utilisateur -d votre_base`

- mais nous n'avons pas encore de **database**

## Creation dans psql d'une BDD

- Ainsi nous allons créer une database , qui sera validée par un message de confirmation

```
CREATE DATABASE helloworld;
CREATE DATABASE
```

- Puis je vais à nouveau essayer de lancer

`pgcli -U votre_utilisateur -d votre_base`

- Mais il semble que la connexion par mot de passe ne soit pas configuré **( Peer authentication failed for user "meodel")**

- Nous allons donc chercher **pg_hba.conf**

`sudo find /etc -name pg_hba.conf`

- Puis nous allons ouvrir le fichier correspondant pour l'éditor avec **nano**

`sudo nano /etc/postgresql/16/main/pg_hba.conf`

- Afin de modifier la ligne :

`local   all             all                                     peer`

- En :

`local   all             all                                     md5`

- Le changement à md5 indique à PostgreSQL de demander un mot de passe pour les connexions locales.

- Puis nous allons fermer l'éditeur

- Et on redémarre postgreSQL pour appliquer les modifications :

`sudo systemctl restart postgresql`

- et enfin ... nous sommes connectés à **PGCLI**

## Tadaaaa !

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>
<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

![border](../assets/line/border_r.png)
