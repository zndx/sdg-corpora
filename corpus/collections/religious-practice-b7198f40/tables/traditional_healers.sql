CREATE TABLE traditional_healers (
  id INTEGER NOT NULL,
  healer_id VARCHAR(32),
  specialist_type VARCHAR(32),
  region_of_practice VARCHAR(32),
  is_recognized BOOLEAN,
  survey_response_id INTEGER,
  traditional_medicine_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (survey_response_id) REFERENCES survey_responses (survey_response_id),
  FOREIGN KEY (traditional_medicine_id) REFERENCES traditional_medicines (id)
);
