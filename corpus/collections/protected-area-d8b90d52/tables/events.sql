CREATE TABLE events (
  event_id INTEGER NOT NULL,
  event_name VARCHAR(32),
  event_date TIMESTAMP,
  event_type VARCHAR(32),
  location VARCHAR(32),
  organizer VARCHAR(32),
  attendance_count INTEGER,
  a_l_p_a_r_c_id INTEGER,
  management_unit_id INTEGER,
  project_leader_employee_id VARCHAR(32),
  PRIMARY KEY (event_id),
  FOREIGN KEY (a_l_p_a_r_c_id) REFERENCES a_l_p_a_r_cs (id),
  FOREIGN KEY (management_unit_id) REFERENCES management_units (id),
  FOREIGN KEY (project_leader_employee_id) REFERENCES project_leaders (employee_id)
);
