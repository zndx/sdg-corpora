CREATE TABLE organizational_healths (
  health_id VARCHAR(32) NOT NULL,
  organization_id VARCHAR(40),
  health_score DECIMAL,
  assessment_date TIMESTAMP,
  health_status VARCHAR(32),
  improvement_areas VARCHAR(32),
  assessed_for_organization_id INTEGER,
  workplace_award_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (health_id),
  FOREIGN KEY (assessed_for_organization_id) REFERENCES organizations (id),
  FOREIGN KEY (workplace_award_id) REFERENCES workplace_awards (workplace_award_id)
);
