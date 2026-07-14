CREATE TABLE technologies_informations (
  digital_technology_id INTEGER NOT NULL,
  personal_information_id INTEGER NOT NULL,
  PRIMARY KEY (digital_technology_id, personal_information_id),
  FOREIGN KEY (digital_technology_id) REFERENCES digital_technologies (id),
  FOREIGN KEY (personal_information_id) REFERENCES personal_informations (personal_information_id)
);
