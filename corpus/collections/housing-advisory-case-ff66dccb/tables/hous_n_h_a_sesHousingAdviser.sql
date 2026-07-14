CREATE TABLE hous_n_h_a_sesHousingAdviser (
  n_h_a_s_id INTEGER NOT NULL,
  housing_adviser_id INTEGER NOT NULL,
  PRIMARY KEY (n_h_a_s_id, housing_adviser_id),
  FOREIGN KEY (n_h_a_s_id) REFERENCES hous_n_h_a_ses (id),
  FOREIGN KEY (housing_adviser_id) REFERENCES hous_housing_advisers (id)
);
