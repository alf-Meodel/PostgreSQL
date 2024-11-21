<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# Les Triggers

![border](../assets/line/border_r.png)

### Triggers :

```
Automatisent des actions en réaction à des événements sur une table.
```

### Fonction de type trigger :

```
Définit la logique exécutée par le trigger.
```

### NEW/OLD :

```
Fournissent les valeurs avant ou après une modification.
```

# Sommaire

- [Définition](#définition)

![border](../assets/line/border_r.png)
![border](../assets/line/line_pink_point_r.png)

# Définition

- Un trigger est un mécanisme qui permet d'exécuter automatiquement une action (souvent une fonction) lorsqu'un événement spécifique se produit sur une table (par exemple, une insertion, une mise à jour ou une suppression).

![border](../assets/line/line_teal_point_r.png)

# Objectif

- Nous allons créer un trigger simple qui réagit à un événement sur une table et enregistre des informations dans une autre table.
- L'exemple consistera à suivre les modifications **(INSERT, UPDATE, DELETE)** effectuées sur une table users et à les consigner dans une table audit_log.

![border](../assets/line/line_teal_point_r.png)

# Résumé des étapes

### Création des tables :

- Une table principale (users).
- Une table d'audit (audit_log).

### Création d'une fonction de type trigger :

- La fonction gère les actions (INSERT, UPDATE, DELETE) et insère les logs.

### Création du trigger :

- Le trigger est lié à la table principale (users) et appelle la fonction de log.

### Tests :

- En effectuant des actions sur users, le trigger enregistre automatiquement les logs dans audit_log.

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/line_teal_point_r.png)

# Étape 1 : Créer une table principale

- Dans un premeit temps nous allosn créer une table users qui contiendra les informations basiques sur les utilisateurs

```
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
```

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/line_teal_point_r.png)

# Étape 2 : Créer une table pour les logs

- Création de la table audit_log :
- Qui enregistrera les modifications effectuées sur la table users

```
CREATE TABLE audit_log (
    id SERIAL PRIMARY KEY,
    action_type VARCHAR(10) NOT NULL, -- Type d'action (INSERT, UPDATE, DELETE)
    user_id INT,                      -- ID de l'utilisateur affecté
    user_name VARCHAR(50),            -- Nom de l'utilisateur affecté
    user_email VARCHAR(100),          -- Email de l'utilisateur affecté
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Heure de l'action
);
```

### Explications :

- Cette table est dédiée au suivi des actions sur la table users.
- Chaque colonne enregistrera des informations sur l'action effectuée.

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/line_teal_point_r.png)

# Étape 3 : Créer une fonction associée au trigger

#### Créer une fonction log_user_activity :

- Les triggers **utilisent des fonctions de type trigger** pour exécuter des actions.
- Cette fonction va insérer des logs dans audit_log en fonction de l'action réalisée.

```
CREATE OR REPLACE FUNCTION log_user_activity()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO audit_log (action_type, user_id, user_name, user_email)
        VALUES ('INSERT', NEW.id, NEW.name, NEW.email);
        RETURN NEW;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO audit_log (action_type, user_id, user_name, user_email)
        VALUES ('UPDATE', NEW.id, NEW.name, NEW.email);
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO audit_log (action_type, user_id, user_name, user_email)
        VALUES ('DELETE', OLD.id, OLD.name, OLD.email);
        RETURN OLD;
    END IF;
END;
$$;
```

### Explications :

- RETURNS TRIGGER : La fonction retourne des informations nécessaires pour le trigger.
- TG_OP : Variable spéciale contenant le type d'opération déclenchée (INSERT, UPDATE, DELETE).
- NEW et OLD :
  - NEW : Contient les nouvelles valeurs (pour INSERT et UPDATE).
  - OLD : Contient les anciennes valeurs (pour DELETE et UPDATE).
- En fonction du type d'opération (TG_OP), la fonction insère un log dans audit_log.

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/line_teal_point_r.png)

# ETAPE 4 : Créer le Trigger

### Créer un trigger user_activity_trigger :

- Ce trigger sera lié à la table users et déclenchera la fonction log_user_activity.

```
CREATE TRIGGER user_activity_trigger
AFTER INSERT OR UPDATE OR DELETE
ON users
FOR EACH ROW
EXECUTE FUNCTION log_user_activity();
```

### Explications :

- AFTER INSERT OR UPDATE OR DELETE : Le trigger se déclenche après l'exécution d'une des trois actions.
- ON users : Le trigger est associé à la table users.
- FOR EACH ROW : Le trigger s'exécute pour chaque ligne affectée par l'action.
- EXECUTE FUNCTION : Appelle la fonction log_user_activity à chaque déclenchement.

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/line_teal_point_r.png)

# Étape 5 : Tester le trigger

## Effectuer des actions sur la table users :

- Ajoute, mets à jour et supprime des utilisateurs pour vérifier que le trigger fonctionne.

- Insertion d'un utilisateur :

```
INSERT INTO users (name, email)
VALUES ('Alice', 'alice@example.com');
```

- Mise à jour d'un utilisateur :

```
UPDATE users
SET email = 'alice.new@example.com'
WHERE name = 'Alice';
```

- Suppression d'un utilisateur :

```
DELETE FROM users
WHERE name = 'Alice';
```

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/line_teal_point_r.png)

# Étape 6 : Vérifier les logs

#### Consulter la table audit_log :

- Les actions effectuées sur la table users doivent être enregistrées dans audit_log.

```
SELECT * FROM audit_log;
```

- ce qui nous donnera les actions effectuées sur la table users.

```
id | action_type | user_id | user_name | user_email | action_time
----+-------------+---------+-----------+--------------------+---------------------
1 | INSERT | 1 | Alice | alice@example.com | 2024-11-21 14:00:00
2 | UPDATE | 1 | Alice | alice.new@example.com | 2024-11-21 14:10:00
3 | DELETE | 1 | Alice | alice.new@example.com | 2024-11-21 14:20:00
```

![border](../assets/line/line_pink_point_l.png)

<a href="#sommaire"><img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>

![border](../assets/line/border_r.png)
