CREATE TABLE policies_technologies (
  privacy_policy_id INTEGER NOT NULL,
  digital_technology_id INTEGER NOT NULL,
  PRIMARY KEY (privacy_policy_id, digital_technology_id),
  FOREIGN KEY (privacy_policy_id) REFERENCES privacy_policies (id),
  FOREIGN KEY (digital_technology_id) REFERENCES digital_technologies (id)
);
