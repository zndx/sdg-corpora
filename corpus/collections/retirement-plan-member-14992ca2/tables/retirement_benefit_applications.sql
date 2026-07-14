CREATE TABLE retirement_benefit_applications (
  retirement_benefit_application_id INTEGER NOT NULL,
  application_id VARCHAR(32),
  application_date TIMESTAMP,
  benefit_type VARCHAR(32),
  benefit_option VARCHAR(53),
  benefit_start_date DATE,
  marital_status VARCHAR(32),
  spouse_consent_status VARCHAR(36),
  application_status VARCHAR(32),
  member_id INTEGER,
  benefit_option_id INTEGER,
  spousal_consent_id INTEGER,
  PRIMARY KEY (retirement_benefit_application_id),
  FOREIGN KEY (member_id) REFERENCES retirement_plan_members (member_id),
  FOREIGN KEY (benefit_option_id) REFERENCES benefit_options (id),
  FOREIGN KEY (spousal_consent_id) REFERENCES spousal_consents (spousal_consent_id)
);
