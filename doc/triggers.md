<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# Les Triggers

![border](../assets/line/border_r.png)

# Sommaire

- [Définition](#définition)
- [Mise en place](#mise-en-place)

![border](../assets/line/border_r.png)

![border](../assets/line/line_pink_point_r.png)

# Définition

Un trigger est un mécanisme qui permet d'exécuter automatiquement une action (souvent une fonction) lorsqu'un événement spécifique se produit sur une table **(par exemple, une insertion, une mise à jour ou une suppression)**.

## Mise en place

- Dans un premier temps nous allons simplement nous connecter ou rejoindre directement une database existante

```
pgcli -U <ton_utilisateur>
pgcli -U <ton_utilisateur> -d <database>
```

- Puis nous allons créer une nouvelle base de donnée et nous connecter à elle

```
CREATE DATABASE exemple_db;
\c exemple_db
```

- Afin de créer notre première table

```
CREATE TABLE utilisateurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(150),
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Objectif

Créer un trigger qui :

- Vérifie et modifie les données avant qu'elles soient insérées dans la table.
- Enregistre les modifications dans une table de journalisation après une mise à jour.

![border](../assets/line/line_pink_point_l.png)

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/border_r.png)
