CREATE TABLE m_e_s_a_programs (
  id INTEGER NOT NULL,
  program_id INTEGER,
  program_name VARCHAR(32),
  host_institution VARCHAR(32),
  location_building VARCHAR(32),
  location_room VARCHAR(32),
  contact_phone VARCHAR(32),
  contact_fax VARCHAR(32),
  transfer_rate DECIMAL,
  total_students_served INTEGER,
  underrepresented_percentage DECIMAL,
  PRIMARY KEY (id)
);
