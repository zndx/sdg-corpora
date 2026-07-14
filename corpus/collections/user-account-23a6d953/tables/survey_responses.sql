CREATE TABLE survey_responses (
  id INTEGER NOT NULL,
  response_id VARCHAR(35),
  survey_topic VARCHAR(32),
  rating_score INTEGER,
  feedback_text VARCHAR(32),
  submission_date TIMESTAMP,
  is_anonymous BOOLEAN,
  user_account_id INTEGER,
  service_offering_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (user_account_id) REFERENCES user_accounts (id),
  FOREIGN KEY (service_offering_id) REFERENCES service_offerings (id)
);
