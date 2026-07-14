CREATE TABLE clie_financial_controllers (
  financial_controller_id INTEGER NOT NULL,
  controller_id VARCHAR(32),
  full_name VARCHAR(36),
  qualification_status VARCHAR(32),
  employment_type VARCHAR(32),
  days_per_week INTEGER,
  base_location VARCHAR(32),
  has_driver_license BOOLEAN,
  engagement_id INTEGER,
  junior_accountant_id INTEGER,
  PRIMARY KEY (financial_controller_id),
  FOREIGN KEY (engagement_id) REFERENCES clie_client_engagements (engagement_id),
  FOREIGN KEY (junior_accountant_id) REFERENCES clie_junior_accountants (junior_accountant_id)
);
