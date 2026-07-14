CREATE TABLE trusts_professionals (
  health_trust_id INTEGER NOT NULL,
  nursing_professional_id INTEGER NOT NULL,
  PRIMARY KEY (health_trust_id, nursing_professional_id),
  FOREIGN KEY (health_trust_id) REFERENCES health_trusts (health_trust_id),
  FOREIGN KEY (nursing_professional_id) REFERENCES nursing_professionals (id)
);
