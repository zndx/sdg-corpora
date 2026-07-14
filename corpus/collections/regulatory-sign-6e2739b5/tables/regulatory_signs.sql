CREATE TABLE regulatory_signs (
  id INTEGER NOT NULL,
  sign_identifier VARCHAR(32),
  sign_message VARCHAR(32),
  sign_shape VARCHAR(32),
  sign_color VARCHAR(32),
  is_retroreflectorized BOOLEAN,
  is_illuminated BOOLEAN,
  installation_date TIMESTAMP,
  status VARCHAR(32),
  traffic_regulation_id INTEGER,
  roadway_segment_id INTEGER,
  sign_standard_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (traffic_regulation_id) REFERENCES traffic_regulations (id),
  FOREIGN KEY (roadway_segment_id) REFERENCES roadway_segments (roadway_segment_id),
  FOREIGN KEY (sign_standard_id) REFERENCES sign_standards (id)
);
