CREATE TABLE action_plans (
  id INTEGER NOT NULL,
  plan_id INTEGER,
  title VARCHAR(32),
  total_recommendations INTEGER,
  adoption_date TIMESTAMP,
  international_environmental_conference_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (international_environmental_conference_id) REFERENCES international_environmental_conferences (id)
);
