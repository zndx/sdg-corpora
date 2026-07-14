CREATE TABLE spiritual_needs (
  need_id VARCHAR(44) NOT NULL,
  need_type VARCHAR(32),
  severity_level INTEGER,
  is_addressed_by_physician BOOLEAN,
  requires_conversion BOOLEAN,
  physician_id VARCHAR(32),
  conversion_moment_id INTEGER,
  PRIMARY KEY (need_id),
  FOREIGN KEY (physician_id) REFERENCES divine_physicians (physician_id),
  FOREIGN KEY (conversion_moment_id) REFERENCES conversion_moments (id)
);
