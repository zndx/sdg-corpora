CREATE TABLE explorers (
  explorer_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  birth_date DATE,
  death_date DATE,
  nationality VARCHAR(32),
  specialization VARCHAR(32),
  skills VARCHAR(32),
  expedition_id INTEGER,
  award_id INTEGER,
  document_id INTEGER,
  PRIMARY KEY (explorer_id),
  FOREIGN KEY (expedition_id) REFERENCES expeditions (expedition_id),
  FOREIGN KEY (award_id) REFERENCES awards (id),
  FOREIGN KEY (document_id) REFERENCES documents (id)
);
