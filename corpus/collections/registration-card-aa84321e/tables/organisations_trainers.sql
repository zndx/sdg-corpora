CREATE TABLE organisations_trainers (
  organisation_id VARCHAR(36) NOT NULL,
  trainer_id INTEGER NOT NULL,
  PRIMARY KEY (organisation_id, trainer_id),
  FOREIGN KEY (organisation_id) REFERENCES training_organisations (organisation_id),
  FOREIGN KEY (trainer_id) REFERENCES trainers (id)
);
