<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# Procédures Stoquées

![border](../assets/line/border_r.png)

# Sommaire

- [Définition](#définition)
- [EXEMPLE 1](#exemple-1)
  - [Mise en place ](#mise-en-place)
  - [Creation de notre procédure stockée](#creation-de-notre-procédure-stockée)
  - [Call Procédure stockée ](#call-procédure-stockée)

## Définition

- Les procédures stockées sont des ensembles d'instructions SQL encapsulées qui permettent d'effectuer des opérations complexes au sein de la base de données. Ces procédures sont utiles pour automatiser des tâches répétitives ou encapsuler une logique métier au sein du serveur de base de données.

![border](../assets/line/line_pink_point_l.png)

# EXEMPLE 1

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

## Creation de notre procédure stockée

- Imaginons que nous souhaitions insérer un utilisateur dans la table utilisateurs ; nous pouvons utiliser un procédure stockée pour effectuer cela :

```
CREATE OR REPLACE PROCEDURE ajouter_utilisateur(nom_utilisateur VARCHAR, email_utilisateur VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO utilisateurs (nom, email)
    VALUES (nom_utilisateur, email_utilisateur);
    RAISE NOTICE 'Utilisateur ajouté : %, %', nom_utilisateur, email_utilisateur;
END;
$$;
```

## CALL procédure stockée

- Avant tout nous allons vori la liste des procédures stockées :

```
\df+
```

- Comme le corps de notre procédure strockée est un insert nous allons passer par elle pour insérer un utilisateur dans la table utilisateurs en utilisant **CALL**

```
CALL ajouter_utilisateur('Jean Dupont', 'jean.dupont@example.com');
CALL ajouter_utilisateur('Alice Martin', 'alice.martin@example.com');
```

- Ce qui va ajouter un utilisateur en executant la commande insert into présente dans notre procédure stockée

![border](../assets/line/line_pink_point_l.png)

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/border_r.png)
