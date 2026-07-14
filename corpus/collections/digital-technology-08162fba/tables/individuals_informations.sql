CREATE TABLE individuals_informations (
  individual_id INTEGER NOT NULL,
  personal_information_id INTEGER NOT NULL,
  PRIMARY KEY (individual_id, personal_information_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (id),
  FOREIGN KEY (personal_information_id) REFERENCES personal_informations (personal_information_id)
);
