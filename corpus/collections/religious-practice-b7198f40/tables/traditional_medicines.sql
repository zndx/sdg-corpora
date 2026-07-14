CREATE TABLE traditional_medicines (
  id INTEGER NOT NULL,
  medicine_id VARCHAR(32),
  medicine_name VARCHAR(32),
  source_material VARCHAR(32),
  intended_effect VARCHAR(32),
  traditional_healer_id INTEGER,
  survey_response_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (traditional_healer_id) REFERENCES traditional_healers (id),
  FOREIGN KEY (survey_response_id) REFERENCES survey_responses (survey_response_id)
);
