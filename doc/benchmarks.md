<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# BENCHMARKS

![border](../assets/line/border_r.png)

# Comparaison : `uuid_generate_v4()` vs `gen_random_uuid()`

![border](../assets/line/border_b.png)

| Critères                     | `uuid_generate_v4()`                          | `gen_random_uuid()`                                 |
| ---------------------------- | --------------------------------------------- | --------------------------------------------------- |
| **Type d'UUID**              | UUID v4 (basé sur des nombres aléatoires)     | UUID v4 (basé sur des nombres aléatoires)           |
| **Extension nécessaire**     | `uuid-ossp`                                   | `pgcrypto`                                          |
| **Disponibilité par défaut** | Non (doit être installée manuellement)        | Oui (disponible si `pgcrypto` est activé)           |
| **Performance**              | Légèrement plus lent                          | Plus rapide (utilise un générateur aléatoire natif) |
| **Générateur aléatoire**     | Basé sur la bibliothèque système (libc, etc.) | Basé sur le générateur interne de PostgreSQL        |
| **Compatibilité**            | Plus portable avec d'autres bases PostgreSQL  | Spécifique à PostgreSQL (moins portable)            |
| **Cas d'usage idéal**        | Nécessite une compatibilité accrue            | Performances élevées et simplicité                  |
| **Installation requise**     | Oui (`CREATE EXTENSION uuid-ossp`)            | Oui (`CREATE EXTENSION pgcrypto`)                   |
| **Sécurité aléatoire**       | Dépend du système sous-jacent                 | Meilleure sécurité grâce à un générateur interne    |

![border](../assets/line/line_teal_point_r.png)

![border](../assets/line/line_teal_point_l.png)

<a href="#comparaison-entre-gen_random_uuid-et-uuid-v4"> <img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;"></a>
<a href="../README.md">
<img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

![border](../assets/line/border_r.png)
