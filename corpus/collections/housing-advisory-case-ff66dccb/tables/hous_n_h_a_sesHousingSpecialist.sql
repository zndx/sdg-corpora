CREATE TABLE hous_n_h_a_sesHousingSpecialist (
  n_h_a_s_id INTEGER NOT NULL,
  housing_specialist_id INTEGER NOT NULL,
  PRIMARY KEY (n_h_a_s_id, housing_specialist_id),
  FOREIGN KEY (n_h_a_s_id) REFERENCES hous_n_h_a_ses (id),
  FOREIGN KEY (housing_specialist_id) REFERENCES hous_housing_specialists (id)
);
