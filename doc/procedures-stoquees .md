<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# Procédures Stoquées

![border](../assets/line/border_r.png)

# Sommaire

- [Définition](#définition)
- [Création des tables nécessaires](#étape-1--création-des-tables-nécessaires)
- [Création de la procédure stockée](#étape-2--création-de-la-procédure-stockée)
- [Appel de la procédure stockée](#étape-3--appel-de-la-procédure-stockée)
- [Vérification des données](#étape-4--vérification-des-données)
- [Manipuler et tester la procédure](#étape-5--manipuler-et-tester-la-procédure)

## Définition

- Les procédures stockées sont des ensembles d'instructions SQL encapsulées qui permettent d'effectuer des opérations complexes au sein de la base de données. Ces procédures sont utiles pour automatiser des tâches répétitives ou encapsuler une logique métier au sein du serveur de base de données.

## Étape 1 : Création des tables nécessaires

- Nous allons créer une procédure stockée pour ajouter un utilisateur dans une table users avec un ID, un nom et une adresse email.

- Création de la table user

```
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
```

## Étape 2 : Création de la procédure stockée

- Nous allons créer une procédure **add_user** permettant d'insérer un utilisateur dans la table users

```
CREATE OR REPLACE PROCEDURE add_user(
    user_name VARCHAR,
    user_email VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO users (name, email)
    VALUES (user_name, user_email);
END;
$$;
```

### Détail :

- **LANGUAGE plpgsql :** Spécifie le langage utilisé pour écrire la procédure.

  - Pourquoi ce langage ? Il permet de combiner des instructions SQL classiques avec des structures de contrôle (comme des IF, LOOP, etc.).

- **plpgsql :** Cela signifie Procedural Language PostgreSQL, un langage spécifique pour écrire des procédures dans PostgreSQL.

```
AS $$ ... $$
AS : Introduit le corps de la procédure.
$$ : Délimiteurs pour le code qui suit. Cela signifie que tout ce qui se trouve entre $$ ... $$ est considéré comme le code de la procédure. On peut utiliser d'autres délimiteurs (par exemple, $$ peut être remplacé par $$code$$, mais $$ est le choix courant).
```

## BEGIN ... END;

- **BEGIN :** Marque le début du corps de la procédure. À partir de là, nous écrivons la logique que la procédure doit exécuter.

- **END; :** Marque la fin du corps de la procédure. Cela termine le bloc principal.

Entre BEGIN et END, nous pouvons inclure plusieurs instructions SQL, comme des requêtes INSERT, UPDATE, ou des contrôles logiques.

## Étape 3 : Appel de la procédure stockée

- Une fois la procédure créée, nous pouvons l'appeler avec les paramètres suivants afin d'ajouter un utilisateur.

```
CALL add_user('John Doe', 'john.doe@example.com');
```

## Étape 4 : Vérification des données

Pour confirmer que les données ont été ajoutées, nous allons vérifier le contenu de la table users

```
SELECT * FROM users;
```

## Étape 5 : Manipuler et tester la procédure

Nous allons éprouver la procédure avec d'autres données :

```
CALL add_user('Jane Doe', 'jane.doe@example.com');
```

- Si on essaye d'ajouter un email déjà existant, PostgreSQL renverra une erreur en raison de la **contrainte UNIQUE** sur la colonne email.

![border](../assets/line/line_pink_point_l.png)

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/border_r.png)
