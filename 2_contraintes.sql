-- L’année du festival doit être réaliste
ALTER TABLE FESTIVAL
ADD CONSTRAINT chk_festival_annee CHECK (f_annee BETWEEN 2000 AND 2100);

-- Le montant du sponsor doit être positif
ALTER TABLE SPONSOR
ADD CONSTRAINT chk_sponsor_montant CHECK (s_montant > 0);

-- Les dates de contrat du sponsor doivent être cohérentes
ALTER TABLE SPONSOR
ADD CONSTRAINT chk_sponsor_dates CHECK (s_debut_contrat <= s_fin_contrat);

-- Le prix d’un billet doit être strictement positif
ALTER TABLE BILLET
ADD CONSTRAINT chk_billet_prix CHECK (Prix_billet > 0);

-- La durée d’hébergement doit être positive
ALTER TABLE HEBERGEMENT
ADD CONSTRAINT chk_hebergement_duree CHECK (h_duree > 0);

-- Le numéro de transport doit être positif
ALTER TABLE TRANSPORT
ADD CONSTRAINT chk_transport_num CHECK (t_numero > 0);

-- Le mode de billet ne peut pas être vide
ALTER TABLE BILLET
MODIFY Mode_billet VARCHAR(50) NOT NULL;

-- Le contact d’un artiste doit être unique
ALTER TABLE ARTISTE
ADD CONSTRAINT unique_artiste_contact UNIQUE (a_contact);

-- Le nom du festival ne peut pas être vide
ALTER TABLE FESTIVAL
MODIFY f_nom VARCHAR(50) NOT NULL;

-- La capacité d’une scène doit être un nombre positif
ALTER TABLE SCENE
ADD CONSTRAINT chk_scene_capacite CHECK (CAST(s_capacite AS SIGNED) > 0);

-- Un artiste doit avoir une nationalité renseignée
ALTER TABLE ARTISTE
MODIFY a_nationalite VARCHAR(50) NOT NULL;

-- Le nom et prénom du spectateur ne peuvent pas être vides
ALTER TABLE SPECTATEUR
MODIFY Prenom_spectateur VARCHAR(50) NOT NULL;
ALTER TABLE SPECTATEUR
MODIFY Nom_spectateur VARCHAR(50) NOT NULL;
