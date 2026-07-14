CREATE TABLE policies_individuals (
  privacy_policy_id INTEGER NOT NULL,
  individual_id INTEGER NOT NULL,
  PRIMARY KEY (privacy_policy_id, individual_id),
  FOREIGN KEY (privacy_policy_id) REFERENCES privacy_policies (id),
  FOREIGN KEY (individual_id) REFERENCES individuals (id)
);
