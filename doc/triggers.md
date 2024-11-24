<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# Les Triggers

![border](../assets/line/border_r.png)

# Sommaire

- [Définition](#définition)
- [Mise en place](#mise-en-place)
- [EXERCICE NIVEAU 1](#exercice-niveau-1)
  - [Objectif](#objectif)
  - [Créer la fonction du trigger](#créer-la-fonction-du-trigger)
  - [Créer le trigger](#créer-le-trigger)
  - [Test du trigger](#test-du-trigger)
  - [Supprimer le trigger](#supprimer-le-trigger)
- [EXERCICE NIVEAU 2](#exercice-niveau-2)
  - [Creer une table de journalisation](#creer-une-table-de-journalisation)
  - [Créer une fonction déclenchée (trigger function)](#créer-une-fonction-déclenchée-trigger-function)

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

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/line_pink_point_r.png)

# EXERCICE NIVEAU 1

## Objectif

### Créer un trigger qui :

- Avant l'insertion, vérifie si le champ nom n'est pas vide
- Si c'est le cas le trigger va rajouter une valeur par défaut à la place du champs vide

Nous allons reprendre la table de **mise en place** suivante :

```
CREATE TABLE utilisateurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(150),
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Créer la fonction du trigger

- La fonction va simplement vérifier et modifier la valeur de nom si elle est manquante avant d'insérer la donnée.

```
CREATE OR REPLACE FUNCTION verifie_nom()
RETURNS TRIGGER AS $$
BEGIN
    -- Si le champ 'nom' est NULL ou vide, on force une valeur par défaut
    IF NEW.nom IS NULL OR NEW.nom = '' THEN
        NEW.nom := 'Nom inconnu';
    END IF;

    RETURN NEW; -- Retourner la nouvelle ligne (modifiée ou non)
END;
$$ LANGUAGE plpgsql;
```

# Créer le trigger

On applique ce trigger sur les INSERT de la table utilisateurs.

```
CREATE TRIGGER trigger_verifie_nom
BEFORE INSERT ON utilisateurs
FOR EACH ROW
EXECUTE FUNCTION verifie_nom();
```

## Test du trigger

Insérer un utilisateur avec un nom vide :

```
INSERT INTO utilisateurs (nom, email)
VALUES ('', 'example1@example.com');
```

Insérer un utilisateur sans nom (NULL) :

```
INSERT INTO utilisateurs (email)
VALUES ('example2@example.com');
```

Insérer un utilisateur avec un nom :
sql
Copier le code

```
INSERT INTO utilisateurs (nom, email)
VALUES ('Alice', 'alice@example.com');
```

Ce qui nous permet de constater que le trigger à bien fonctionné :

```

postgres@(none):exemple_db> select * FROM utilisateurs;
+----+-------------+----------------------------+----------------------------+
| id | nom         | email                      | date_creation              |
|----+-------------+----------------------------+----------------------------|
| 1  | Franck      | franck.leroy222@hotmail.fr | 2024-11-24 14:27:50.417427 |
| 2  | Toto        | toto@gmail.com             | 2024-11-24 15:52:27.053268 |
| 3  | Titi        | Titi@gmail.com             | 2024-11-24 15:53:02.263819 |
| 4  | Nom inconnu | example1@example.com       | 2024-11-24 19:30:01.348073 |
| 5  | Nom inconnu | example2@example.com       | 2024-11-24 19:30:13.626132 |
| 6  | Alice       | alice@example.com          | 2024-11-24 19:30:19.106275 |
+----+-------------+----------------------------+----------------------------+
```

## Supprimer le trigger et la fonction

- Il est bien evidemment possible de supprimer le trigger et sa focntion

```
DROP TRIGGER IF EXISTS trigger_verifie_nom ON utilisateurs;
DROP FUNCTION IF EXISTS verifie_nom();
```

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/line_pink_point_r.png)

# EXERCICE NIVEAU 2

Créer un trigger qui :

- [ ] Vérifie et modifie les données avant qu'elles soient insérées dans la table.
- [ ] Enregistre les modifications dans une table de journalisation après une mise à jour.

## Creer une table de journalisation

- Dans un premier temps nous allons créer une table **journal_utilisateur** pour enregistrer les modifications sur la table utilisateurs

- ainsi nous allons copier dans cette table les données de la table utilisateurs avant et après la modification.

  - Nous rajoutons le un PK pour cette table
  - Ancien et nouveau nom
  - Ancien et nouvel email
  - Nous rajoutons un champs Operation
  - Nous rajoutons un champs Operation

  Pour les autres données elles ne nous interessent pas dans le cadre du Triger alors on les recopie simplement

```
CREATE TABLE journal_utilisateurs (
    id SERIAL PRIMARY KEY,
    utilisateur_id INT,
    operation VARCHAR(50),
    ancien_nom VARCHAR(100),
    ancien_email VARCHAR(150),
    nouveau_nom VARCHAR(100),
    nouveau_email VARCHAR(150),
    date_modification TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Créer une fonction déclenchée (trigger function)

Cette fonction sera appelée par le trigger et effectuera les actions suivantes :

- **Avant INSERT** : Normaliser les Adresses e-mail (en les convertissant en minuscules)
- **Après UPDATE** : Ajouter une entrée dans la table journal_utilsiateur pour enregistrer les anciennes et nouvelles valeurs

```
CREATE OR REPLACE FUNCTION gestion_utilisateurs()
RETURNS TRIGGER AS $$
BEGIN
    -- Normalisation des e-mails avant INSERT
    IF (TG_OP = 'INSERT') THEN
        NEW.email = LOWER(NEW.email); -- Convertir l'email en minuscule
        RETURN NEW;
    END IF;

    -- Enregistrer les modifications après UPDATE
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO journal_utilisateurs (
            utilisateur_id,
            operation,
            ancien_nom,
            ancien_email,
            nouveau_nom,
            nouveau_email
        )
        VALUES (
            OLD.id,
            'UPDATE',
            OLD.nom,
            OLD.email,
            NEW.nom,
            NEW.email
        );
        RETURN NEW;
    END IF;

    RETURN NULL; -- Par défaut
END;
$$ LANGUAGE plpgsql;
```

### Créer le trigger

On lie la fonction au trigger. Ce dernier sera déclenché sur les événements INSERT et UPDATE.

```
CREATE TRIGGER trigger_gestion_utilisateurs
BEFORE INSERT OR AFTER UPDATE
ON utilisateurs
FOR EACH ROW
EXECUTE FUNCTION gestion_utilisateurs();
```

## Tester le trigger

## Insertion d'un nouvel utilisateur :

```
INSERT INTO utilisateurs (nom, email)
VALUES ('John Doe', 'John.Doe@EXAMPLE.COM');

SELECT * FROM utilisateurs;
```

Le trigger normalisera l’e-mail en minuscule avant son insertion.

## Mise à jour d’un utilisateur :

```
UPDATE utilisateurs
SET nom = 'Jonathan Doe', email = 'jonathan.doe@Example.com'
WHERE id = 1;

SELECT * FROM utilisateurs;
SELECT * FROM journal_utilisateurs;
```

Le trigger ajoutera une entrée dans journal_utilisateurs pour enregistrer les anciennes et nouvelles valeurs.

## Résultat attendu

### Table utilisateurs après l'insertion :

### Résultats attendus

#### 1. Table `utilisateurs` après l'insertion :

| id  | nom      | email                | date_creation       |
| --- | -------- | -------------------- | ------------------- |
| 1   | John Doe | john.doe@example.com | 2024-11-24 12:00:00 |

#### 2. Table `journal_utilisateurs` après la mise à jour :

| id  | utilisateur_id | operation | ancien_nom | ancien_email         | nouveau_nom  | nouveau_email            | date_modification   |
| --- | -------------- | --------- | ---------- | -------------------- | ------------ | ------------------------ | ------------------- |
| 1   | 1              | UPDATE    | John Doe   | john.doe@example.com | Jonathan Doe | jonathan.doe@example.com | 2024-11-24 12:05:00 |

## Supprimer le trigger

- Pour supprimer un trigger, utilise cette commande :

```
DROP TRIGGER IF EXISTS trigger_gestion_utilisateurs ON utilisateurs;
DROP FUNCTION IF EXISTS gestion_utilisateurs();
```

![border](../assets/line/line_pink_point_l.png)

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/border_r.png)
