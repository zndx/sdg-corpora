CREATE TABLE es_employees (
  s_m_e_id INTEGER NOT NULL,
  employee_id INTEGER NOT NULL,
  PRIMARY KEY (s_m_e_id, employee_id),
  FOREIGN KEY (s_m_e_id) REFERENCES s_m_es (s_m_e_id),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
