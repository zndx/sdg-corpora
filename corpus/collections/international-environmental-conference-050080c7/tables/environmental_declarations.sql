CREATE TABLE environmental_declarations (
  id INTEGER NOT NULL,
  declaration_id VARCHAR(35),
  title VARCHAR(32),
  adoption_date TIMESTAMP,
  total_principles INTEGER,
  issuing_conference VARCHAR(32),
  international_environmental_conference_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (international_environmental_conference_id) REFERENCES international_environmental_conferences (id)
);
