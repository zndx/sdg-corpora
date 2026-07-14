CREATE TABLE programmes_components (
  corporate_responsibility_programme_id INTEGER NOT NULL,
  c_s_r_component_id INTEGER NOT NULL,
  PRIMARY KEY (corporate_responsibility_programme_id, c_s_r_component_id),
  FOREIGN KEY (corporate_responsibility_programme_id) REFERENCES corporate_responsibility_programmes (id),
  FOREIGN KEY (c_s_r_component_id) REFERENCES c_s_r_components (id)
);
