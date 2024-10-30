<h1 style="color: #008080;">PostgreSQL</h1>

<h3 style="color: #ab638c"> Différences majeures entre PostegreSQL et MYSQL </h2>

| Critères                 | MySQL                                      | PostegreSQL                                              |
| ------------------------ | ------------------------------------------ | -------------------------------------------------------- |
| Utilisation              | pour les petites applications.             | adapté aux applications de niveau professionnel.         |
| Conformité SQL           | permissive                                 | rigoureuse                                               |
| Gestion des données JSON | Basique, JSON pris en charge               | Avancée, avec le type JSONB pour stockage et indexation. |
| Performances             | Rapide en lecture                          | Optimal pour les requetes complexes                      |
| Extensibilité            | Limitée en extensions et personnalisation. | Très extensible avec de nombreuses extensions .          |

### Avantages de PostgreSQL :

<span style="color: #ab638c"></span>

- **Conformité SQL** : PostgreSQL suit strictement les normes SQL en garantissant la fiabilité des applications complexes par une structure solide.

- **Transactions et ACID** : PostgreSQL applique les principes **ACID** pour des opérations de haute intégrité :

  - **Atomicité** : Une transaction est "tout ou rien" ; <span style="color: #ab638c"> si une partie échoue, tout est annulé.</span>

  - **Cohérence** : <span style="color: #ab638c">La base reste organisée et valide avant et après chaque transaction.</span>
  - **Isolation** : <span style="color: #ab638c">Les transactions simultanées n’interfèrent pas entre elles</span>, garantissant des résultats précis.
  - **Durabilité** : <span style="color: #ab638c">Une fois validées, les données sont sauvegardées en permanence, même en cas de panne.</span>

- **Gestion avancée des données** : PostgreSQL prend en charge **JSONB** (format structuré pour des données complexes comme des objets JSON) et **PostGIS** (extension géospatiale, idéale pour les applications de cartographie).

- **Performance** : Excellente pour traiter de grandes quantités de données et des requêtes complexes, bien adapté aux écritures et lectures intensives.

### Cas d'usage adaptés :

- **Applications analytiques** : Idéal pour des analyses et rapports détaillés sur de grands volumes de données.
- **Banques et Finances** : Gère des transactions sûres et précises, parfait pour des opérations bancaires complexes.

- **Systèmes de gestion de données** : Excellente gestion de données variées comme des cartes géographiques ou des documents structurés (JSON).

- **Applications critiques** : Idéal pour des services **où la disponibilité et la sécurité sont essentielles**, comme les **services de santé et de sécurité.**

<h1 style="color: #008080;">GET STARTED</h1>

- [Linux](doc/setup_linux.md)
- [Windows](doc/setup_windows.md)
