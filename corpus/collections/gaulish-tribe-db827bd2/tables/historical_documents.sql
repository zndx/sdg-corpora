CREATE TABLE historical_documents (
  id INTEGER NOT NULL,
  document_title VARCHAR(32),
  author VARCHAR(32),
  publication_year INTEGER,
  document_type VARCHAR(32),
  content_summary VARCHAR(32),
  linguistic_analysis_id INTEGER,
  toponym_id INTEGER,
  epigraphic_inscription_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (linguistic_analysis_id) REFERENCES linguistic_analysises (id),
  FOREIGN KEY (toponym_id) REFERENCES toponyms (id),
  FOREIGN KEY (epigraphic_inscription_id) REFERENCES epigraphic_inscriptions (epigraphic_inscription_id)
);
