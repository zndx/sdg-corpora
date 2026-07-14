CREATE TABLE chemical_activities (
  id INTEGER NOT NULL,
  activity_id VARCHAR(34),
  activity_type VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  risk_level VARCHAR(32),
  chemical_management_expert_id INTEGER,
  regulation_id INTEGER,
  facility_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (chemical_management_expert_id) REFERENCES chemical_management_experts (id),
  FOREIGN KEY (regulation_id) REFERENCES environmental_regulations (regulation_id),
  FOREIGN KEY (facility_id) REFERENCES facilities (id)
);
