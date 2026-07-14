CREATE TABLE trainers (
  id INTEGER NOT NULL,
  trainer_id INTEGER,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  email_address VARCHAR(32),
  is_approved BOOLEAN,
  organisation_id VARCHAR(36),
  PRIMARY KEY (id),
  FOREIGN KEY (organisation_id) REFERENCES training_organisations (organisation_id)
);
