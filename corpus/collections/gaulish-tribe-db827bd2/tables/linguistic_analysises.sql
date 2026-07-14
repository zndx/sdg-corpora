CREATE TABLE linguistic_analysises (
  id INTEGER NOT NULL,
  methodology VARCHAR(32),
  slavic_language_basis VARCHAR(32),
  interpretation_result VARCHAR(32),
  author VARCHAR(32),
  publication_year INTEGER,
  epigraphic_inscription_id INTEGER,
  toponym_id INTEGER,
  historical_document_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (epigraphic_inscription_id) REFERENCES epigraphic_inscriptions (epigraphic_inscription_id),
  FOREIGN KEY (toponym_id) REFERENCES toponyms (id),
  FOREIGN KEY (historical_document_id) REFERENCES historical_documents (id)
);
