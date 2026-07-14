CREATE TABLE surveys_forms (
  substance_abuse_survey_id INTEGER NOT NULL,
  substance_abuse_form_id INTEGER NOT NULL,
  PRIMARY KEY (substance_abuse_survey_id, substance_abuse_form_id),
  FOREIGN KEY (substance_abuse_survey_id) REFERENCES substance_abuse_surveys (id),
  FOREIGN KEY (substance_abuse_form_id) REFERENCES substance_abuse_forms (id)
);
