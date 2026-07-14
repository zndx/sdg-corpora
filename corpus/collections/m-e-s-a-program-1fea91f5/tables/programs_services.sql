CREATE TABLE programs_services (
  m_e_s_a_program_id INTEGER NOT NULL,
  support_service_id INTEGER NOT NULL,
  PRIMARY KEY (m_e_s_a_program_id, support_service_id),
  FOREIGN KEY (m_e_s_a_program_id) REFERENCES m_e_s_a_programs (id),
  FOREIGN KEY (support_service_id) REFERENCES support_services (support_service_id)
);
