CREATE TABLE options_applications (
  benefit_option_id INTEGER NOT NULL,
  retirement_benefit_application_id INTEGER NOT NULL,
  PRIMARY KEY (benefit_option_id, retirement_benefit_application_id),
  FOREIGN KEY (benefit_option_id) REFERENCES benefit_options (id),
  FOREIGN KEY (retirement_benefit_application_id) REFERENCES retirement_benefit_applications (retirement_benefit_application_id)
);
