CREATE TABLE accreditations (
  id INTEGER NOT NULL,
  accreditation_id VARCHAR(44),
  issuing_agency VARCHAR(44),
  start_date DATE,
  end_date DATE,
  status VARCHAR(32),
  PRIMARY KEY (id)
);
