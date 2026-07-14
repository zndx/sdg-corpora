CREATE TABLE guardians (
  guardian_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  relationship VARCHAR(32),
  home_phone VARCHAR(32),
  mobile_phone VARCHAR(32),
  work_phone VARCHAR(32),
  email VARCHAR(32),
  admission_application_id INTEGER,
  address_id VARCHAR(44),
  child_id INTEGER,
  PRIMARY KEY (guardian_id),
  FOREIGN KEY (admission_application_id) REFERENCES admission_applications (id),
  FOREIGN KEY (address_id) REFERENCES addresses (address_id),
  FOREIGN KEY (child_id) REFERENCES childs (id)
);
