CREATE TABLE hous_housing_specialistsHousingAdvisoryCase (
  housing_specialist_id INTEGER NOT NULL,
  housing_advisory_case_id INTEGER NOT NULL,
  PRIMARY KEY (housing_specialist_id, housing_advisory_case_id),
  FOREIGN KEY (housing_specialist_id) REFERENCES hous_housing_specialists (id),
  FOREIGN KEY (housing_advisory_case_id) REFERENCES hous_housing_advisory_cases (id)
);
