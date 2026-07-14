CREATE TABLE persons (
  person_id INTEGER NOT NULL,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  professional_title VARCHAR(32),
  affiliated_organization VARCHAR(39),
  contact_email VARCHAR(32),
  contact_phone_number VARCHAR(32),
  board_appointment_id INTEGER,
  firm_id VARCHAR(44),
  affiliate_council_id INTEGER,
  PRIMARY KEY (person_id),
  FOREIGN KEY (board_appointment_id) REFERENCES board_appointments (board_appointment_id),
  FOREIGN KEY (firm_id) REFERENCES law_firms (firm_id),
  FOREIGN KEY (affiliate_council_id) REFERENCES affiliate_councils (id)
);
