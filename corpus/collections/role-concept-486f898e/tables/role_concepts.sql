CREATE TABLE role_concepts (
  concept_id INTEGER NOT NULL,
  origin_language VARCHAR(32),
  theoretical_perspective VARCHAR(32),
  definition_text VARCHAR(32),
  related_concepts VARCHAR(32),
  enactment_id INTEGER,
  perception_id VARCHAR(32),
  PRIMARY KEY (concept_id),
  FOREIGN KEY (enactment_id) REFERENCES role_enactments (enactment_id),
  FOREIGN KEY (perception_id) REFERENCES role_perceptions (perception_id)
);
