<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# LINUX POSTEGRESQL

![border](../assets/line/border_r.png)

# Sommaire

- [Setup](#setup)

---

## Contexte

Imaginons une base de données de gestion d’une école avec trois tables principales :

- students : contient des informations sur les étudiants.
- courses : contient des informations sur les cours offerts par l'école.
- enrollments : enregistre les inscriptions des étudiants dans les cours.
  Structure des Tables
  Voici un aperçu des trois tables pour que la requête ait du sens.

## Table etudiants

```
| id_etudiant | prenom | nom    |
|-------------|--------|--------|
| 1           | Alice  | Dupont |
| 2           | Bob    | Martin |
| 3           | Claire | Petit  |
```

## Table cours

```
| id_cours | nom_cours     | enseignant   |
|----------|---------------|--------------|
| 101      | Mathématiques | M. Durand    |
| 102      | Sciences      | Mme Lefevre  |
| 103      | Histoire      | M. Bernard   |

```

## Table inscriptions

```
| id_inscription | id_etudiant | id_cours |
|----------------|-------------|----------|
| 1              | 1           | 101      |
| 2              | 1           | 102      |
| 3              | 2           | 101      |
| 4              | 3           | 103      |

```

## Objectif de la Requête

Nous voulons récupérer une liste des étudiants inscrits, avec les cours qu’ils suivent et le nom de leurs enseignants.

Requête SQL avec INNER JOIN

```
SELECT etudiants.prenom, etudiants.nom, cours.nom_cours, cours.enseignant
FROM inscriptions
INNER JOIN etudiants ON inscriptions.id_etudiant = etudiants.id_etudiant
INNER JOIN cours ON inscriptions.id_cours = cours.id_cours;
```

## Explication de la Requête

Sélection des Colonnes : La requête sélectionne le prénom et le nom des étudiants, le nom des cours et le nom de l'enseignant.
Table Principale : inscriptions est utilisée comme table de base, car elle relie les étudiants aux cours.
Premier INNER JOIN :
INNER JOIN etudiants ON inscriptions.id_etudiant = etudiants.id_etudiant
Ce JOIN associe chaque ligne de inscriptions avec la table etudiants, en utilisant id_etudiant comme clé commune.
Deuxième INNER JOIN :
INNER JOIN cours ON inscriptions.id_cours = cours.id_cours
Ce JOIN associe chaque ligne de inscriptions avec la table cours, en utilisant id_cours comme clé commune.

## Résultat de la Requête

```
| prenom | nom    | nom_cours     | enseignant |
|--------|--------|---------------|------------|
| Alice  | Dupont | Mathématiques | M. Durand  |
| Alice  | Dupont | Sciences      | Mme Lefevre|
| Bob    | Martin | Mathématiques | M. Durand  |
| Claire | Petit  | Histoire      | M. Bernard |

```

## Explication du Résultat

La requête retourne une ligne pour chaque inscription.
En utilisant les INNER JOIN, on obtient des informations provenant des tables etudiants et cours pour chaque inscription.

---

![border](../assets/line/line_teal_point_l.png)

## SETUP

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>
<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

![border](../assets/line/border_r.png)
