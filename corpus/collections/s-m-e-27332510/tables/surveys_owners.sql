CREATE TABLE surveys_owners (
  survey_id INTEGER NOT NULL,
  business_owner_id INTEGER NOT NULL,
  PRIMARY KEY (survey_id, business_owner_id),
  FOREIGN KEY (survey_id) REFERENCES surveys (id),
  FOREIGN KEY (business_owner_id) REFERENCES business_owners (business_owner_id)
);
