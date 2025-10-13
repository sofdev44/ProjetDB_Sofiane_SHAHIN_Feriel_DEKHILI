-- Liste des festivals après 2023
SELECT f_nom, f_annee
FROM FESTIVAL
WHERE f_annee > 2023;

-- Artistes de nationalité marocaine
SELECT a_nom, a_prenom, a_style_musical
FROM ARTISTE
WHERE a_nationalite = 'Marocain';

-- Concerts se déroulant entre juin et août
SELECT Id_concert, c_date, c_heure
FROM CONCERT
WHERE c_date BETWEEN '2023-06-01' AND '2023-08-31';

-- Spectateurs réguliers ou habitués
SELECT Prenom_spectateur, Nom_spectateur
FROM SPECTATEUR
WHERE Frequentation_spectateur IN ('Régulière', 'Habitué');

-- Styles musicaux uniques présents au festival
SELECT DISTINCT a_style_musical
FROM ARTISTE;



-- Nombre total de festivals par année
SELECT f_annee, COUNT(*) AS nb_festivals
FROM FESTIVAL
GROUP BY f_annee;

-- Prix moyen des billets par catégorie
SELECT Categorie_billet, AVG(Prix_billet) AS prix_moyen
FROM BILLET
GROUP BY Categorie_billet;

-- Montant total des sponsors par festival
SELECT Id_Festival, SUM(s_montant) AS total_sponsoring
FROM SPONSOR
GROUP BY Id_Festival;

-- Nombre d’artistes par nationalité
SELECT a_nationalite, COUNT(*) AS nb_artistes
FROM ARTISTE
GROUP BY a_nationalite;

-- Durée moyenne d’hébergement des artistes (supérieure à 3 jours uniquement)
SELECT AVG(h_duree) AS duree_moyenne
FROM HEBERGEMENT
HAVING duree_moyenne > 3;


-- Liste des concerts avec le nom du festival et de la scène
SELECT F.f_nom, C.c_date, S.s_nom
FROM CONCERT C
JOIN FESTIVAL F ON C.Id_Festival = F.Id_Festival
JOIN SCENE S ON C.Id_scene = S.Id_scene;

-- Artistes et festivals où ils se produisent
SELECT A.a_nom, A.a_prenom, F.f_nom
FROM SE_PRODUIT SP
JOIN ARTISTE A ON SP.Id_Artiste = A.Id_Artiste
JOIN FESTIVAL F ON SP.Id_Festival = F.Id_Festival;

-- Billets avec le nom du spectateur et du concert
SELECT B.Id_billet, S.Prenom_spectateur, F.f_nom
FROM BILLET B
JOIN SPECTATEUR S ON B.Id_spectateur = S.Id_spectateur
JOIN FESTIVAL F ON B.Id_Festival = F.Id_Festival;

-- Sponsors et festivals associés
SELECT SP.s_nom, F.f_nom, SP.s_montant
FROM SPONSOR SP
LEFT JOIN FESTIVAL F ON SP.Id_Festival = F.Id_Festival;

-- Moyenne du prix des billets par festival
SELECT F.f_nom, AVG(B.Prix_billet) AS prix_moyen
FROM BILLET B
JOIN FESTIVAL F ON B.Id_Festival = F.Id_Festival
GROUP BY F.f_nom;


-- Artistes qui se sont produits dans le festival “Mawazine”
SELECT a_nom, a_prenom
FROM ARTISTE
WHERE Id_Artiste IN (
  SELECT Id_Artiste
  FROM SE_PRODUIT
  WHERE Id_Festival = (SELECT Id_Festival FROM FESTIVAL WHERE f_nom = 'Festival Mawazine')
);

-- Spectateurs ayant acheté un billet VIP
SELECT Prenom_spectateur, Nom_spectateur
FROM SPECTATEUR
WHERE Id_spectateur IN (
  SELECT Id_spectateur FROM BILLET WHERE Categorie_billet = 'VIP'
);

-- Festivals ayant reçu des sponsors de plus de 30 000
SELECT f_nom
FROM FESTIVAL
WHERE Id_Festival IN (
  SELECT Id_Festival FROM SPONSOR WHERE s_montant > 30000
);

-- Artistes qui n’ont pas encore d’hébergement attribué
SELECT a_nom, a_prenom
FROM ARTISTE
WHERE Id_Artiste NOT IN (
  SELECT Id_Artiste FROM HEBERGEMENT
);

-- Scènes où se sont produits des artistes marocains
SELECT s_nom
FROM SCENE
WHERE Id_scene IN (
  SELECT Id_scene
  FROM CONCERT
  WHERE (Id_Festival, Id_concert) IN (
    SELECT Id_Festival, Id_concert
    FROM SE_PRODUIT
    WHERE Id_Artiste IN (
      SELECT Id_Artiste FROM ARTISTE WHERE a_nationalite = 'Marocain'
    )
  )
);
