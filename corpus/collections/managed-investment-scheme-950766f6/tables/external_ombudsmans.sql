CREATE TABLE external_ombudsmans (
  external_ombudsman_id INTEGER NOT NULL,
  ombudsman_name VARCHAR(32),
  contact_phone VARCHAR(32),
  contact_email VARCHAR(32),
  jurisdiction VARCHAR(32),
  established_date DATE,
  PRIMARY KEY (external_ombudsman_id)
);
