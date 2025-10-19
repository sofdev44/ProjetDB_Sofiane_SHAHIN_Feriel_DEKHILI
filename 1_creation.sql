CREATE TABLE SPECTATEUR (
  Id_spectateur INT PRIMARY KEY,
  Prenom_spectateur VARCHAR(50),
  Nom_spectateur VARCHAR(50),
  Frequentation_spectateur VARCHAR(50)
);

CREATE TABLE SCENE (
  Id_scene INT PRIMARY KEY,
  s_nom VARCHAR(50),
  s_capacite VARCHAR(50)
);


CREATE TABLE FESTIVAL (
  Id_Festival INT PRIMARY KEY,
  f_nom VARCHAR(50),
  f_annee INT
);




CREATE TABLE SPONSOR (
  id_s INT PRIMARY KEY,
  s_nom VARCHAR(50),
  s_type VARCHAR(50),
  s_montant INT,
  s_debut_contrat INT,
  s_fin_contrat INT,
  Id_Festival INT,
  FOREIGN KEY (Id_Festival) REFERENCES FESTIVAL(Id_Festival)
);


CREATE TABLE ARTISTE (
  Id_Artiste INT PRIMARY KEY,
  a_nom VARCHAR(50),
  a_prenom VARCHAR(50),
  a_nationalite VARCHAR(50),
  a_style_musical VARCHAR(50),
  a_notoriete VARCHAR(50),
  a_contact VARCHAR(50)
);


CREATE TABLE CONCERT (
  Id_Festival INT,
  Id_concert INT,
  c_date VARCHAR(50),
  c_heure VARCHAR(50),
  Id_scene INT,
  PRIMARY KEY (Id_Festival, Id_concert),
  FOREIGN KEY (Id_Festival) REFERENCES FESTIVAL(Id_Festival),
  FOREIGN KEY (Id_scene) REFERENCES SCENE(Id_scene)
);


CREATE TABLE MEDIAS (
  Id_Festival INT,
  m_id INT,
  m_nom VARCHAR(50),
  PRIMARY KEY (Id_Festival, m_id),
  FOREIGN KEY (Id_Festival) REFERENCES FESTIVAL(Id_Festival)
);





CREATE TABLE SECURITE (
  Id_s INT PRIMARY KEY,
  nom_securite VARCHAR(50),
  type_securite VARCHAR(50),
  Id_Festival INT,
  FOREIGN KEY (Id_Festival) REFERENCES FESTIVAL(Id_Festival)
);

CREATE TABLE BILLET (
  Id_billet INT PRIMARY KEY,
  Id_spectateur INT,
  Id_Festival INT,
  Id_concert INT,
  Categorie_billet VARCHAR(50),
  Prix_billet INT,
  Mode_billet VARCHAR(50),
  Paiement_billet VARCHAR(50),
  Date_achat_billet VARCHAR(50),
  FOREIGN KEY (Id_spectateur) REFERENCES SPECTATEUR(Id_spectateur),
  FOREIGN KEY (Id_Festival, Id_concert) REFERENCES CONCERT(Id_Festival, Id_concert)
);

CREATE TABLE HEBERGEMENT (
  Id_hebergement INT PRIMARY KEY,
  h_hebergement VARCHAR(50),
  h_hotel VARCHAR(50),
  h_adresse VARCHAR(50),
  h_duree INT,
  Id_Artiste INT,
  FOREIGN KEY (Id_Artiste) REFERENCES ARTISTE(Id_Artiste)
);



CREATE TABLE TRANSPORT (
  Id_transport INT PRIMARY KEY,
  t_type VARCHAR(50),
  t_numero INT,
  Id_Artiste INT,
  FOREIGN KEY (Id_Artiste) REFERENCES ARTISTE(Id_Artiste)
);


CREATE TABLE SE_PRODUIT (
  Id_Festival INT,
  Id_concert INT,
  Id_Artiste INT,
  PRIMARY KEY (Id_Festival, Id_concert, Id_Artiste),
  FOREIGN KEY (Id_Festival, Id_concert) REFERENCES CONCERT(Id_Festival, Id_concert),
  FOREIGN KEY (Id_Artiste) REFERENCES ARTISTE(Id_Artiste)
);






















