CREATE TABLE n_l_f_representatives (
  n_l_f_representative_id INTEGER NOT NULL,
  rep_identifier VARCHAR(32),
  rep_name VARCHAR(32),
  adoption_case_id INTEGER,
  PRIMARY KEY (n_l_f_representative_id),
  FOREIGN KEY (adoption_case_id) REFERENCES adoption_cases (id)
);
