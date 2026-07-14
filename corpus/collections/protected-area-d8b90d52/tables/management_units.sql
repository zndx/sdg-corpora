CREATE TABLE management_units (
  id INTEGER NOT NULL,
  unit_id VARCHAR(44),
  unit_name VARCHAR(32),
  headquarters_location VARCHAR(32),
  establishment_date DATE,
  legal_status VARCHAR(32),
  contact_email VARCHAR(32),
  protected_area_id INTEGER,
  a_l_p_a_r_c_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (protected_area_id) REFERENCES protected_areas (id),
  FOREIGN KEY (a_l_p_a_r_c_id) REFERENCES a_l_p_a_r_cs (id)
);
