CREATE TABLE reports_questions (
  expert_advisory_report_id INTEGER NOT NULL,
  regulatory_advisory_question_id INTEGER NOT NULL,
  PRIMARY KEY (expert_advisory_report_id, regulatory_advisory_question_id),
  FOREIGN KEY (expert_advisory_report_id) REFERENCES expert_advisory_reports (id),
  FOREIGN KEY (regulatory_advisory_question_id) REFERENCES regulatory_advisory_questions (id)
);
