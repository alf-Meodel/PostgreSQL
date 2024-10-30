<h1 style="color: #008080;">LINUX POSTEGRESQL </h1>

<h1 style="color: #ab638c"> GET STARTED </h1>

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

## Première connexion à mysql

- Pour nous connecter nous allons utiliser la commande suivante :

` sudo -i -u postgres`

- Ce qui nosu permettra d'accéder au **Terminal PostegreSQL** avec :

## `psql`

<h1 style="color: #ab638c"> Installation de pgAdmin 4 </h1>

#### Introduction

_pgAdmin 4 est une interface graphique complète pour administrer et gérer les bases de données PostgreSQL. Elle permet de créer, modifier et surveiller des bases de données facilement, sans ligne de commande._

#### Installation

- Dans un premier temps nous allons mettre à jour nos paquets

`sudo apt update`

- Puis nous allons installer la version desktop de **pgAdmin4** avec la commande :

`sudo apt install pgadmin4-desktop `

- Ce qui nous permettra de lancer la version desktop manuellement à partir de notre bureau
- **PS : une version web existe**

<h1 style="color: #ab638c"> Installation de pgCli </h1>
