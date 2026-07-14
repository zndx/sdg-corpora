CREATE TABLE radiologists_studies (
  radiologist_id INTEGER NOT NULL,
  imaging_study_id INTEGER NOT NULL,
  PRIMARY KEY (radiologist_id, imaging_study_id),
  FOREIGN KEY (radiologist_id) REFERENCES radiologists (id),
  FOREIGN KEY (imaging_study_id) REFERENCES imaging_studies (id)
);
