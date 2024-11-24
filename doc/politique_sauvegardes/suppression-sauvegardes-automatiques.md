<a href="../../README.md">
  <img src="../../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>
<a href="/BDD/regles-de-sauvegardes.md">
  <img src="../../assets/button/previous_page.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

### Suppression AUTOMATIQUE des sauvegardes tout les 15 jours

```
  nano ~/backup_pg.sh

#!/bin/bash
# Variables pour le script
TIMESTAMP=$(date +%Y%m%d%H%M%S)  # Horodatage pour les noms de fichiers uniques
BACKUP_DIR=~/backups             # Dossier de sauvegarde
DB_NAME=aubondeal            # Nom de la base de données
DB_USER=postgres                  # Nom d'utilisateur de PostgreSQL

# Exécuter pg_dump pour sauvegarder la base de données dans le répertoire de sa>
pg_dump -U $DB_USER -d $DB_NAME -F c -f "$BACKUP_DIR/${DB_NAME}_$TIMESTAMP.sql"

# Vérification de la réussite
if [ $? -eq 0 ]; then
    echo "Sauvegarde de la base de données réussie : ${BACKUP_DIR}/${DB_NAME}_$>
else
    echo "Échec de la sauvegarde de la base de données."
fi
# Supprimer les sauvegardes de plus de 15 jours
find "$BACKUP_DIR" -type f -name "aubondeal_*.sql" -mtime +15 -exec rm {} \;

```

## Ligne de suppression :

```
# Supprimer les sauvegardes de plus de 15 jours
find "$BACKUP_DIR" -type f -name "aubondeal_*.sql" -mtime +15 -exec rm {} \;
```
