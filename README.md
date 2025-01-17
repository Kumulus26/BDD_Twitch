# Twitch Database Redesign - Project Readme

## Introduction
Ce projet a été réalisé dans le cadre d'un Travaux Dirigés (TD) en cours. L'objectif principal était de concevoir et de recréer la base de données de Twitch tout en respectant un ensemble de contraintes pédagogiques. Ce travail a permis de mettre en pratique les compétences acquises en modélisation, en écriture de scripts SQL, et en gestion de données.

---

## Objectifs du Projet
- **Modélisation conceptuelle** : Créer un Modèle Conceptuel de Données (MCD) en utilisant le logiciel Looping.
- **Modélisation logique** : Convertir le MCD en un Modèle Logique de Données (MLD).
- **Script SQL** : Rédiger un script SQL pour créer la base de données comprenant un minimum de 50 tables.
- **Insertion de données** : Ajouter des données significatives pour tester et valider les relations entre les tables.
- **Requêtes SQL** : Fournir des exemples de requêtes SQL pour exploiter la base de données et illustrer les fonctionnalités principales de la plateforme Twitch.

---

## Contraintes
1. Livrer un **MCD** et un **MLD** clairs et bien structurés.
2. Utiliser le logiciel **Looping** pour les étapes de modélisation.
3. Concevoir un **script SQL** contenant un minimum de 50 tables avec des relations pertinentes.
4. Insérer des **données réalistes** pour simuler l’activité de Twitch (ex : utilisateurs, streamers, catégories, streams, abonnements, etc.).
5. Fournir **plusieurs requêtes SQL** pour démontrer les capacités d’interrogation de la base de données.

---

## Contenu du Repository
- **MCD et MLD** : Fichiers de modélisation créés avec Looping.
- **Script SQL** :
  - Création des tables avec les relations (clé primaire, clé étrangère).
  - Ajout de contraintes (ex : UNIQUE, NOT NULL).
  - Index pour optimiser les performances.
- **Données insérées** : Exemple de données pour tester les fonctionnalités de la base.
- **Requêtes SQL** :
  - Recherches avancées (ex : top des streamers par catégorie).
  - Requêtes d’agrégation (ex : nombre total d’abonnements par mois).
  - Gestion des données (ex : suppression d’un utilisateur et mise à jour des données liées).

---

## Technologies Utilisées
- **Logiciel Looping** : Pour la création des MCD et MLD.
- **SQL** : Langage pour la création et l’interrogation de la base de données.

---

## Instructions pour Utiliser le Projet
1. **Cloner le Repository** :
   ```bash
   git clone <URL-du-repository>
   ```

2. **Exécuter le Script SQL** :
   Importez le fichier `twitch1.sql` dans votre système de gestion de base de données (MySQL, PostgreSQL, etc.) pour créer les tables et insérer les données.

3. **Tester les Requêtes** :
   Utilisez les fichiers de requêtes pour explorer la base de données et vérifier sa structure et ses performances.

---

## Résultats Attendus
- Une base de données fonctionnelle simulant les principales fonctionnalités de Twitch.
- Une structure bien normalisée avec des relations entre les tables.
- Des exemples de requêtes SQL pour interroger la base efficacement.

---

## Auteur
Réalisé par Axel dans le cadre d'un TD.

---

## Remerciements
Merci aux enseignants pour leur encadrement et aux camarades de classe pour leur collaboration et leurs retours constructifs.

