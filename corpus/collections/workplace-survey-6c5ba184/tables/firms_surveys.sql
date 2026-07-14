CREATE TABLE firms_surveys (
  research_firm_id INTEGER NOT NULL,
  workplace_survey_id INTEGER NOT NULL,
  PRIMARY KEY (research_firm_id, workplace_survey_id),
  FOREIGN KEY (research_firm_id) REFERENCES research_firms (research_firm_id),
  FOREIGN KEY (workplace_survey_id) REFERENCES workplace_surveys (id)
);
