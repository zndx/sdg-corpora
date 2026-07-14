CREATE TABLE programs_degrees (
  m_e_s_a_program_id INTEGER NOT NULL,
  math_based_degree_id INTEGER NOT NULL,
  PRIMARY KEY (m_e_s_a_program_id, math_based_degree_id),
  FOREIGN KEY (m_e_s_a_program_id) REFERENCES m_e_s_a_programs (id),
  FOREIGN KEY (math_based_degree_id) REFERENCES math_based_degrees (id)
);
