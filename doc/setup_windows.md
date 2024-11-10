<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# WINDOWS POSTEGRESQL

![border](../assets/line/border_r.png)

# Sommaire

- [PostgreSQL](#setup)
- [Premier pas](#premiers-pas)
- [Ajouter PostgreSQL au PATH](#ajouter-postgresql-au-path)
- [Pgcli](#pgcli)

---

---

![border](../assets/line/line_teal_point_l.png)

## SETUP

![border](../assets/line/line_multi_point_r.png)

## Premiers pas

- Dans un premier temps nous allons télécharger l'installateur sur le site [setup windows](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

- Puis nous allons ajouter PostegreSQL au path

## Ajouter PostgreSQL au PATH :

- Ouvrez les Paramètres Windows.
- Allez dans Système > À propos.
- Cliquez sur Paramètres avancés du système (sur la droite).
- Dans la fenêtre des Propriétés système, cliquez sur Variables d'environnement.
- Dans la section **Variables système**, sélectionnez la variable Path et cliquez sur Modifier.
- Cliquez sur Nouveau et ajoutez le chemin vers le dossier bin de PostgreSQL, par exemple :

```
C:\Program Files\PostgreSQL\17\bin
```

- Puis nous allons vérifier que l'instalaltion c'est passé correctement avec

```
psql --version
```

![border](../assets/line/line_teal_point_l.png)

## Pgcli

![border](../assets/line/line_multi_point_r.png)

- Pour installer nosu devons avoir un environnement python installé sur notre machine

- Pour vérifier que python est bien présent nous allons écrire ceci en ligne de commande

```
pip --version
```

- Puis pour installer **pgcli** nous allons faire ceci

```
pip install pgcli
```

- une fois l'installation terminé nous allons verifier qu'elle c'est correctement déroulé en faisant :

```
pgcli --version
```

- après ca il ne nous reste plus qu'a créer une database sur postegre pour nous connecter à elle sur pgcli

```
psql -U postgres
CREATE DATABASE nom_de_la_base;
```

![border](../assets/line/line_pink_point_l.png)
<a href="#sommaire">
<img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>
<a href="../README.md">
<img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

![border](../assets/line/border_r.png)
