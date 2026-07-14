CREATE TABLE e_s_g_standards (
  e_s_g_standard_id INTEGER NOT NULL,
  standard_id INTEGER,
  standard_name VARCHAR(32),
  issuing_body VARCHAR(59),
  effective_date DATE,
  jurisdiction VARCHAR(32),
  PRIMARY KEY (e_s_g_standard_id)
);
