CREATE TABLE regulatory_advisory_questions (
  id INTEGER NOT NULL,
  question_id VARCHAR(44),
  question_text VARCHAR(32),
  paraphrased BOOLEAN,
  asked_date TIMESTAMP,
  responded_in_report_paragraph VARCHAR(32),
  expert_advisory_report_id INTEGER,
  financial_modeling_assumption_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (expert_advisory_report_id) REFERENCES expert_advisory_reports (id),
  FOREIGN KEY (financial_modeling_assumption_id) REFERENCES financial_modeling_assumptions (id)
);
