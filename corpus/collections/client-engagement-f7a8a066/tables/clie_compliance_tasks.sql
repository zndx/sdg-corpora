CREATE TABLE clie_compliance_tasks (
  compliance_task_id INTEGER NOT NULL,
  task_id VARCHAR(32),
  task_type VARCHAR(32),
  due_date DATE,
  filing_deadline DATE,
  status VARCHAR(32),
  external_advisor_id VARCHAR(32),
  financial_controller_id INTEGER,
  engagement_id INTEGER,
  account_id VARCHAR(44),
  PRIMARY KEY (compliance_task_id),
  FOREIGN KEY (financial_controller_id) REFERENCES clie_financial_controllers (financial_controller_id),
  FOREIGN KEY (engagement_id) REFERENCES clie_client_engagements (engagement_id),
  FOREIGN KEY (account_id) REFERENCES clie_management_accounts (account_id)
);
