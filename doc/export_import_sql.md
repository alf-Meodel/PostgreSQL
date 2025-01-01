<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# EXPORT IMPORT .sql

![border](../assets/line/border_r.png)

# Sommaire

- [Lire et importer](#setup)


---

---

![border](../assets/line/line_teal_point_l.png)

## SETUP

![border](../assets/line/line_multi_point_r.png)

## Importer

La commande suivante va : 

- Lire le contenu du fichier nestjs_react.sql avec Get-Content.
- Envoyer ce contenu à psql via un pipeline (|).

```
Get-Content .\nestjs_react.sql | psql -U postgres -h localhost -d nestjs_react
```



![border](../assets/line/line_pink_point_l.png)
<a href="#sommaire">
<img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>
<a href="../README.md">
<img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

![border](../assets/line/border_r.png)
