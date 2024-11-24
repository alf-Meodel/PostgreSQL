<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# Les Triggers

![border](../assets/line/border_r.png)

# Sommaire

- [Définition](#définition)
- [Objectif](#objectif)
- [Résumé des étapes](#résumé-des-étapes)
- [Créer une table principale](#étape-1--créer-une-table-principale)
- [Créer une table pour les logs](#étape-2--créer-une-table-pour-les-logs)
- [Créer une fonction associée au trigger](#étape-3--créer-une-fonction-associée-au-trigger)
- [Créer le Trigger](#etape-4--créer-le-trigger)
- [Tester le trigger](#étape-5--tester-le-trigger)
- [Vérifier les logs](#étape-6--vérifier-les-logs)

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

![border](../assets/line/line_pink_point_l.png)

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/border_r.png)
