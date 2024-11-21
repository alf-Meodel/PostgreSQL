<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# Les Contraintes

![border](../assets/line/border_r.png)

## Sommaire

- [PRIMARY KEY](#primary-key)
- [Créer une table avec une clé primaire](#étape-1--créer-une-table-avec-une-clé-primaire)
- [Créer une table avec une clé étrangère](#étape-2--créer-une-table-avec-une-clé-étrangère)
- [Vérification de la relation](#étape-3--vérification-de-la-relation)

# PRIMARY KEY

La contrainte PRIMARY KEY permet de définir une colonne ou un ensemble de colonnes comme identifiant unique de chaque ligne dans une table. Cela signifie que les valeurs de cette colonne ne peuvent pas être nulles et doivent être uniques.

## Résumé :

- Création de la table avec une clé primaire :

  - Utilise SERIAL pour générer automatiquement des valeurs uniques.
  - Déclare une colonne comme PRIMARY KEY.

- Création de la table avec une clé étrangère :

  - Utilise FOREIGN KEY pour lier une colonne à une clé primaire dans une autre table.
  - Ajoute des contraintes comme ON DELETE CASCADE si nécessaire.

- Vérifications et manipulations :

  - Insère des données en respectant les relations définies.
  - PostgreSQL empêche toute incohérence grâce aux contraintes.

# Étape 1 : Créer une table avec une clé primaire

Créer une table users avec une clé primaire :

```
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
```

### Explications :

- SERIAL : Génère automatiquement une valeur incrémentée pour chaque nouvelle ligne.
- PRIMARY KEY : Désigne la colonne id comme clé primaire, garantissant que chaque valeur est unique et non nulle.

# Étape 2 : Créer une table avec une clé étrangère

- Créer une table orders qui fait référence à users via une clé étrangère :

```
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);
```

### Explications :

- order_id : Clé primaire pour identifier chaque commande.
- user_id : Clé étrangère qui référence id dans la table users.
- FOREIGN KEY (user_id) REFERENCES users (id) :
  - Déclare que user_id est une clé étrangère.
  - Garantit que chaque valeur dans user_id doit exister dans la colonne id de la table users.
- DEFAULT CURRENT_TIMESTAMP : Définit la date de commande par défaut à l'heure actuelle.

# Étape 3 : Vérification de la relation

### Insérer des données dans users :

```
INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com');
```

### Insérer des données dans orders :

```
INSERT INTO orders (user_id, amount) VALUES
(1, 50.00),  -- Référence l'utilisateur 'Alice' (id = 1)
(2, 75.50);  -- Référence l'utilisateur 'Bob' (id = 2)
```

### Vérifier les données :

Afficher les utilisateurs puis les commandes :

```
SELECT * FROM users;
SELECT * FROM orders;

```

<a href="#sommaire">
  <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>
<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

![border](../assets/line/border_r.png)
