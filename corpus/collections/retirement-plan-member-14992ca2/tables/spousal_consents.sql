CREATE TABLE spousal_consents (
  spousal_consent_id INTEGER NOT NULL,
  consent_id VARCHAR(44),
  consent_date TIMESTAMP,
  spouse_ssn VARCHAR(32),
  notary_name VARCHAR(32),
  notary_commission_expiry DATE,
  witnessed_by_plan_rep BOOLEAN,
  retirement_benefit_application_id INTEGER,
  member_id INTEGER,
  PRIMARY KEY (spousal_consent_id),
  FOREIGN KEY (retirement_benefit_application_id) REFERENCES retirement_benefit_applications (retirement_benefit_application_id),
  FOREIGN KEY (member_id) REFERENCES retirement_plan_members (member_id)
);
