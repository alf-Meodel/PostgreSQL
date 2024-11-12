<a href="../README.md">
  <img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

# DOCUMENTATION EPHEMERE

![border](../assets/line/border_l.png)

# Sommaire

- [Navigation](#navigation)

![border](../assets/line/border_b.png)

---

# Découverte de MERISE

- [x] Comprendre l'historique et le contexte
      [Comprendre l'historique et le contexte](#comprendre-l-historique-et-le-contexte)
- [x] Identifier les différents niveaux de MERISE
      [Les différents niveaux de Merise sont](#les-différents-niveaux-de-merise-sont)
- [x] Comprendre le vocabulaire de base
      [Les différents niveaux ](#les-différents-niveaux-de-merise-sont)

- [x] Les concepts de base du MCD

  - [x] Les entités

    - [ ] Savoir définir les entités
    - [ ] Savoir nommer les entités
    - [ ] Savoir identifier les occurrences

  - [ ] Le dictionnaire de données

    - [ ] Savoir créer un dictionnaire de données
    - [ ] Savoir définir les propriétés
    - [ ] Savoir typer les propriétés
    - [ ] Savoir documenter les propriétés

  - [ ] Les associations
    - [ ] Savoir définir les associations
    - [ ] Savoir nommer les associations
    - [ ] Savoir identifier les cardinalités

- [ ] Les règles de gestion
  - [ ] Savoir extraire les règles d'un cahier des charges
  - [ ] Savoir formaliser les règles de gestion
  - [ ] Savoir valider la cohérence des règles

---

![border](../assets/line/border_b.png)

## Comprendre l historique et le contexte

![border](../assets/line/line_teal_point_l.png)

**La méthode Merise est une méthode d'analyse et de conception des systèmes d'information née en France dans les années 1970**.

Merise, développée en France dans les années 1970 avec le soutien du ministère de l'Industrie, est une méthode rigoureuse de modélisation des données et traitements, visant à refléter fidèlement les processus métiers.

## Origine

Merise, développée en France dans les années 1970 avec le soutien du ministère de l'Industrie, est une méthode rigoureuse de modélisation des données et traitements, visant à refléter fidèlement les processus métiers.

## Contexte et Motivations

Dans les années 1970, face à la complexité croissante des systèmes, à l'hétérogénéité des méthodes, et au besoin de structuration des données, Merise apporte une modélisation en niveaux conceptuel, logique et physique.

## Structure de la Méthode Merise

Merise s’appuie sur deux modèles : le Modèle de Données (MCD) pour structurer l'information, et le Modèle de Traitements (MCT) pour les flux. Elle suit une approche cyclique en quatre étapes : étude, réalisation, maintenance.

---

## Les différents niveaux de Merise sont

#### Niveau conceptuel :

représente les données et traitements de façon indépendante de toute implémentation technique, centré sur la réalité métier.

#### Niveau logique :

précise la structure des données et des traitements, adaptée aux contraintes d'un SGBD (système de gestion de base de données) spécifique, sans être lié à une plateforme technique.

#### Niveau physique :

détaille la mise en œuvre technique des données et traitements sur une infrastructure informatique précise (par exemple, le choix du SGBD, des index, etc.).

---

![border](../assets/line/line_teal_point_l.png)

# Les Entitées

![border](../assets/line/line_teal_point_l.png)

Voici des détails sur les concepts de base du Modèle Conceptuel des Données (MCD) dans la méthode Merise, et plus précisément sur les entités et leurs caractéristiques.

## Les concepts de base du MCD

Le MCD est le premier niveau de modélisation de données en Merise, qui vise à représenter les données de manière conceptuelle, indépendante des contraintes techniques. Les éléments principaux du MCD sont les entités, associations, attributs, et relations.

## Les entités

Une entité représente un élément fondamental du domaine à modéliser, comme un objet ou une personne. Par exemple, dans une base de données pour une école, les entités pourraient inclure ÉTUDIANT, PROFESSEUR, COURS, etc. L'entité est une représentation abstraite, qui regroupe des occurrences de cet élément dans la réalité (ex. chaque étudiant est une occurrence de l'entité ÉTUDIANT).

## Définir les entités

Définir une entité consiste à identifier les éléments distincts et pertinents du système d’information. Pour définir une entité, il faut :

## Analyser le domaine :

déterminer les objets ou concepts clés de l'activité.
Identifier les informations constantes : un élément qui change régulièrement peut être défini comme un attribut d'une autre entité.
Exemple : dans une application de gestion de bibliothèques, les entités de base seraient LIVRE, AUTEUR, et LECTEUR.

## Nommer les entités

Les entités doivent être nommées de manière explicite, concise et compréhensible pour tous les utilisateurs du système. Les bonnes pratiques incluent :

Utiliser des noms au singulier (ex. ÉTUDIANT et non ÉTUDIANTS).
Choisir des termes non techniques et communs au domaine.
Utiliser des majuscules pour faciliter la lecture des diagrammes.
Identifier les occurrences des entités
Une occurrence d'entité est une instance particulière de cette entité. Par exemple, chaque étudiant (comme "Alice Dupont") est une occurrence de l'entité ÉTUDIANT. Lorsqu’on identifie les occurrences, il est important de :

Associer chaque occurrence à un identifiant unique (clé primaire).
Vérifier qu’elles correspondent bien aux entités définies.
Exemple : dans une table ÉTUDIANT, chaque ligne correspond à une occurrence (ou un enregistrement) de l’entité, où chaque étudiant a un identifiant unique (comme id_etudiant).

En résumé, dans le MCD de Merise, les entités constituent les éléments de base, et une bonne définition, nomination, et identification des occurrences est essentielle pour une modélisation fidèle et compréhensible du système d’information.

---

<a href="#sommaire">
<img src="../assets/button/back_to_top.png" alt="Back to top" style="width: 150px; height: auto;">
</a>
<a href="../README.md">
<img src="../assets/button/home_page.png" alt="Home page" style="width: 150px; height: auto;">
</a>

---

![border](../assets/line/border_r.png)
