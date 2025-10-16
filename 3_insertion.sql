-- ===========================================================
--  Fichier : 3_insertion.sql
--  Description : Insertion automatique de données - Festivals arabes
-- ===========================================================

-- FESTIVAL
INSERT INTO FESTIVAL (Id_Festival, f_nom, f_annee) VALUES
(1, 'Festival Mawazine', 2023),
(2, 'Carthage Music Nights', 2024),
(3, 'Festival de Gouna', 2025);

-- SCENE
INSERT INTO SCENE (Id_scene, s_nom, s_capacite) VALUES
(1, 'Grande Scène Rabat', '8000'),
(2, 'Théâtre Antique de Carthage', '6000'),
(3, 'Plage d’El Gouna', '5000');

-- ARTISTE
INSERT INTO ARTISTE (Id_Artiste, a_nom, a_prenom, a_nationalite, a_style_musical, a_notoriete, a_contact) VALUES
(1, 'Lamjarred', 'Saad', 'Marocain', 'Pop arabe', 'Internationale', 'saad.lamjarred@mail.com'),
(2, 'Elissa', 'Khoury', 'Libanaise', 'Pop orientale', 'Confirmée', 'elissa.kh@mail.com'),
(3, 'Balti', '', 'Tunisien', 'Rap', 'Confirmé', 'balti.tn@mail.com'),
(4, 'Amr', 'Diab', 'Égyptien', 'Pop égyptienne', 'Légende', 'amr.diab@mail.com'),
(5, 'Asma', 'Lmnawar', 'Marocaine', 'Chaâbi', 'Confirmée', 'asma.lmnawar@mail.com');

-- CONCERT
INSERT INTO CONCERT (Id_Festival, Id_concert, c_date, c_heure, Id_scene) VALUES
(1, 1, '2023-06-23', '21:00', 1),
(1, 2, '2023-06-24', '22:00', 1),
(2, 3, '2024-07-15', '20:30', 2),
(3, 4, '2025-08-10', '21:30', 3),
(3, 5, '2025-08-11', '22:00', 3);

-- SPECTATEUR
INSERT INTO SPECTATEUR (Id_spectateur, Prenom_spectateur, Nom_spectateur, Frequentation_spectateur) VALUES
(1, 'Youssef', 'El Amrani', 'Habitué'),
(2, 'Sara', 'Ben Ali', 'Occasionnelle'),
(3, 'Omar', 'Hassan', 'Nouveau'),
(4, 'Leila', 'Toumi', 'Habituée'),
(5, 'Rania', 'El Mansouri', 'Régulière');

-- BILLET
INSERT INTO BILLET (Id_billet, Id_spectateur, Id_Festival, Id_concert, Categorie_billet, Prix_billet, Mode_billet, Paiement_billet, Date_achat_billet) VALUES
(1, 1, 1, 1, 'VIP', 120, 'En ligne', 'Carte', '2023-05-10'),
(2, 2, 1, 2, 'Standard', 60, 'Sur place', 'Espèces', '2023-06-20'),
(3, 3, 2, 3, 'Pass 2 jours', 100, 'En ligne', 'Carte', '2024-06-10'),
(4, 4, 3, 4, 'Standard', 50, 'En ligne', 'Carte', '2025-07-05'),
(5, 5, 3, 5, 'VIP', 110, 'Sur place', 'CB', '2025-07-20');

-- SPONSOR
INSERT INTO SPONSOR (id_s, s_nom, s_type, s_montant, s_debut_contrat, s_fin_contrat, Id_Festival) VALUES
(1, 'Coca-Cola MENA', 'Boisson', 25000, 2022, 2024, 1),
(2, 'Orange Tunisie', 'Télécom', 30000, 2023, 2025, 2),
(3, 'Emirates Airlines', 'Transport', 40000, 2023, 2026, 3);

-- HEBERGEMENT
INSERT INTO HEBERGEMENT (Id_hebergement, h_hebergement, h_hotel, h_adresse, h_duree, Id_Artiste) VALUES
(1, 'Suite', 'Marriott Rabat', 'Avenue Mohammed VI, Rabat', 3, 1),
(2, 'Chambre Deluxe', 'Phoenicia Beirut', 'Corniche, Beyrouth', 4, 2),
(3, 'Studio', 'Laico Tunis', 'Rue du Lac, Tunis', 2, 3),
(4, 'Suite Présidentielle', 'Hilton Cairo', 'Zamalek, Le Caire', 5, 4),
(5, 'Chambre Standard', 'Sofitel Casablanca', 'Bd des Almohades, Casablanca', 3, 5);

-- TRANSPORT
INSERT INTO TRANSPORT (Id_transport, t_type, t_numero, Id_Artiste) VALUES
(1, 'Avion', 7812, 1),
(2, 'Avion', 4599, 2),
(3, 'Voiture', 3321, 3),
(4, 'Avion', 2233, 4),
(5, 'Train', 1289, 5);

-- SE_PRODUIT
INSERT INTO SE_PRODUIT (Id_Festival, Id_concert, Id_Artiste) VALUES
(1, 1, 1),
(1, 2, 5),
(2, 3, 3),
(3, 4, 2),
(3, 5, 4);
