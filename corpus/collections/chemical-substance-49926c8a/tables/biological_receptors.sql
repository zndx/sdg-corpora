CREATE TABLE biological_receptors (
  receptor_id INTEGER NOT NULL,
  receptor_name VARCHAR(37),
  ubiquitous_in_vertebrates BOOLEAN,
  affinity_for_t_c_d_d VARCHAR(32),
  function VARCHAR(40),
  chemical_substance_id INTEGER,
  mechanism_of_carcinogenesis_id INTEGER,
  PRIMARY KEY (receptor_id),
  FOREIGN KEY (chemical_substance_id) REFERENCES chemical_substances (chemical_substance_id),
  FOREIGN KEY (mechanism_of_carcinogenesis_id) REFERENCES mechanism_of_carcinogenesises (id)
);
