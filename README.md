# PostgreSQL (Linux)

<!-- Main IMG -->

![postegrean](assets/img/main_img_postegre.png)

![postegrean](assets/line/border_l.png)

## Navigation

- [Setup Linux](doc/setup_linux.md)
- [Setup Windows](doc/setup_windows.md)
- [Get Started ](doc/get_started.md)
- [Les Procédures Stoquées ](doc/procedures-stoquees%20.md)
- [Les Triggers](doc/triggers.md)
- [DCL, DDL, DML,DQL](doc/dcl-ddl-dml-dql.md)
- [Les rôles](doc/les-roles.md)
- [Commandes CLI](doc/commandes_cli.md)
- [Les Contraintes](doc/les-contraintes.md)

## Sommaire

- [Comparatif & Performances](#comparatif-et-performances)
- [Avantages de PostgreSQL](#avantages-de-postgresql)
- [Cas d'usage adaptés](#best-practices)

## Documents éphémère

- [Documents - éphémères](./doc/documents-éphémères.md)

![postegrean](assets/line/border_b.png)

![border](assets/line/line_pink_point_l.png)

# Comparatif et Performances

![border](assets/line/line_teal_point_r.png)

## Différences majeures entre PostegreSQL et MYSQL

| Critères                 | MySQL                                      | PostegreSQL                                              |
| ------------------------ | ------------------------------------------ | -------------------------------------------------------- |
| Utilisation              | pour les petites applications.             | adapté aux applications de niveau professionnel.         |
| Conformité SQL           | permissive                                 | rigoureuse                                               |
| Gestion des données JSON | Basique, JSON pris en charge               | Avancée, avec le type JSONB pour stockage et indexation. |
| Performances             | Rapide en lecture                          | Optimal pour les requetes complexes                      |
| Extensibilité            | Limitée en extensions et personnalisation. | Très extensible avec de nombreuses extensions .          |

---

<a href="#sommaire">
  <img src="assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

![border](assets/line/line_pink_point_l.png)

## Avantages de PostgreSQL

![border](assets/line/line_teal_point_r.png)

- Dans la même base de donnée fait du r**elationnel et du non relationnel** ( docs... )

- **Conformité SQL** : PostgreSQL suit strictement les normes SQL en garantissant la fiabilité des applications complexes par une structure solide.

- **Transactions et ACID** : PostgreSQL applique les principes **ACID** pour des opérations de haute intégrité :

  - **Atomicité** : Une transaction est "tout ou rien" ; <span style="color: #ab638c">si une partie échoue, tout est annulé.</span>
  - **Cohérence** : <span style="color: #ab638c">La base reste organisée et valide avant et après chaque transaction.</span>
  - **Isolation** : <span style="color: #ab638c">Les transactions simultanées n’interfèrent pas entre elles</span>, garantissant des résultats précis.
  - **Durabilité** : <span style="color: #ab638c">Une fois validées, les données sont sauvegardées en permanence, même en cas de panne.</span>

- **Gestion avancée des données** : PostgreSQL prend en charge **JSONB** (format structuré pour des données complexes comme des objets JSON) et **PostGIS** (extension géospatiale, idéale pour les applications de cartographie).

- **Performance** : Excellente pour traiter de grandes quantités de données et des requêtes complexes, bien adapté aux écritures et lectures intensives.

<a href="#sommaire">
  <img src="assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>

![border](assets/line/line_pink_point_l.png)

## Best Practices

![border](assets/line/line_teal_point_r.png)

- **Applications analytiques** : Idéal pour des analyses et rapports détaillés sur de grands volumes de données.
- **Banques et Finances** : Gère des transactions sûres et précises, parfait pour des opérations bancaires complexes.

- **Systèmes de gestion de données** : Excellente gestion de données variées comme des cartes géographiques ou des documents structurés (JSON).

- **Applications critiques** : Idéal pour des services **où la disponibilité et la sécurité sont essentielles**, comme les **services de santé et de sécurité.**

---

![border](assets/line/border_r.png)

<a href="#sommaire">
  <img src="assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>
