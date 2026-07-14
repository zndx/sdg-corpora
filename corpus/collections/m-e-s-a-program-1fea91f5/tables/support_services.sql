CREATE TABLE support_services (
  support_service_id INTEGER NOT NULL,
  service_id VARCHAR(44),
  service_name VARCHAR(32),
  service_type VARCHAR(32),
  description VARCHAR(32),
  frequency VARCHAR(32),
  is_mandatory BOOLEAN,
  m_e_s_a_program_id INTEGER,
  PRIMARY KEY (support_service_id),
  FOREIGN KEY (m_e_s_a_program_id) REFERENCES m_e_s_a_programs (id)
);
