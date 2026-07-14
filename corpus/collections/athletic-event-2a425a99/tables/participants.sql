CREATE TABLE participants (
  id INTEGER NOT NULL,
  participant_id VARCHAR(44),
  full_name VARCHAR(36),
  age INTEGER,
  is_c_p_r_certified BOOLEAN,
  drug_screen_status VARCHAR(32),
  criminal_check_status VARCHAR(32),
  athletic_event_id INTEGER,
  discipline_report_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (athletic_event_id) REFERENCES athletic_events (id),
  FOREIGN KEY (discipline_report_id) REFERENCES discipline_reports (id)
);
