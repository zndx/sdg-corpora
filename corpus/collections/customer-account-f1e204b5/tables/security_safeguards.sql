CREATE TABLE security_safeguards (
  id INTEGER NOT NULL,
  safeguard_id VARCHAR(32),
  safeguard_name VARCHAR(32),
  safeguard_type VARCHAR(32),
  implementation_date DATE,
  last_audit_date DATE,
  compliance_status VARCHAR(32),
  third_party_service_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (third_party_service_id) REFERENCES third_party_services (id)
);
