<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# Pokemon Context

![border](../assets/line/border_r.png)

# Sommaire

- [Pokemon Context](#pokemon-context)

## Problème SQL : Interactions entre Pokémon

Nous avons une base de données contenant les 150 premiers Pokémon et leurs interactions. Cette base de données contient des informations sur chaque Pokémon, leur type, et les attaques qu'ils possèdent. Nous voulons savoir quels Pokémon peuvent attaquer efficacement d’autres Pokémon en fonction de leurs types d’attaque et de vulnérabilité.

## Contexte

Nous souhaitons obtenir une liste de Pokémon avec les Pokémon adverses contre lesquels ils sont efficaces, en affichant pour chaque ligne :

- Le nom du Pokémon attaquant.
- Le nom de l'attaque qu’il utilise.
- Le nom du Pokémon vulnérable.

### Exemple de résultat attendu

Par exemple, **Salamèche** (type Feu) doit apparaître avec les Pokémon de type Plante, Glace ou Insecte contre lesquels ses attaques sont efficaces.

---

## Structure de la Base de Données

### Table `Pokemons`

| Nom de la colonne | Type de donnée | Description                                |
| ----------------- | -------------- | ------------------------------------------ |
| `pokemon_id`      | UUID           | Identifiant unique du Pokémon              |
| `nom_pokemon`     | VARCHAR(50)    | Nom du Pokémon                             |
| `type_principal`  | VARCHAR(20)    | Type principal du Pokémon (Feu, Eau, etc.) |

### Table `Types`

| Nom de la colonne   | Type de donnée | Description                                   |
| ------------------- | -------------- | --------------------------------------------- |
| `type_id`           | UUID           | Identifiant unique du type                    |
| `nom_type`          | VARCHAR(20)    | Nom du type (Feu, Eau, Plante, etc.)          |
| `vulnerable_contre` | VARCHAR(20)    | Indique le type auquel ce type est vulnérable |

### Table `Attaques`

| Nom de la colonne | Type de donnée | Description                                    |
| ----------------- | -------------- | ---------------------------------------------- |
| `attaque_id`      | UUID           | Identifiant unique de l'attaque                |
| `nom_attaque`     | VARCHAR(50)    | Nom de l'attaque                               |
| `type_attaque`    | VARCHAR(20)    | Type de l'attaque (Feu, Eau, Plante, etc.)     |
| `pokemon_id`      | UUID           | Identifiant du Pokémon possédant cette attaque |

---

## Relation entre les Tables

1. La table `Attaques` est reliée à la table `Pokemons` via la colonne `pokemon_id`, car chaque attaque appartient à un Pokémon.
2. La table `Types` contient les relations de vulnérabilité entre les types.
3. En associant le champ `type_attaque` de `Attaques` avec `vulnerable_contre` de `Types`, nous identifions les Pokémon vulnérables à une attaque donnée.

---

## Requête SQL

Voici la requête SQL qui permet d’obtenir les interactions efficaces entre Pokémon.

```sql
SELECT
    P1.nom_pokemon AS Attaquant,
    Attaques.nom_attaque AS Nom_Attaque,
    P2.nom_pokemon AS Vulnérable
FROM
    Attaques
INNER JOIN Pokemons P1 ON Attaques.pokemon_id = P1.pokemon_id
INNER JOIN Types T1 ON Attaques.type_attaque = T1.nom_type
INNER JOIN Types T2 ON T1.vulnerable_contre = T2.nom_type
INNER JOIN Pokemons P2 ON P2.type_principal = T2.nom_type;
```

<a href="#sommaire">
  <img src="/assets/img/button/back_to_top.png " alt="Back to top" style="width: 150px; height: auto;">
</a>
