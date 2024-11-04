<h1 style="color: #008080;">PK FK</h1>

## Sommaire

---

<a href="/PostgreSQL/README.md">
  <img src="/PostgreSQL/assets/img/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

---

# PRIMARY KEY

La contrainte PRIMARY KEY permet de définir une colonne ou un ensemble de colonnes comme identifiant unique de chaque ligne dans une table. Cela signifie que les valeurs de cette colonne ne peuvent pas être nulles et doivent être uniques.

## Création d'une table avec un PK :

- Après avori supprimé ma table_test

`helloworld> DROP TABLE table_test;`

- Nous allons créer une table en y ajoutant une **PRIMARY KEY**

```
CREATE TABLE table_test (
    id SERIAL PRIMARY KEY,
    prenom VARCHAR(50),
    nom VARCHAR(50),
    email VARCHAR(100),
    age INTEGER,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

Ici, **id est défini comme clé primaire**, ce qui assure que chaque valeur dans la colonne id est unique et non nulle.

## Modification d'une table avec un PK :

CREATE TABLE table_test (
id SERIAL,
prenom VARCHAR(50),
nom VARCHAR(50),
email VARCHAR(100),
age INTEGER,
date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
adresse VARCHAR(100),
telephone VARCHAR(15)
);
