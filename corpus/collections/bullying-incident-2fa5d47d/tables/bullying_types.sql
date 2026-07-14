CREATE TABLE bullying_types (
  type_id VARCHAR(44) NOT NULL,
  type_name VARCHAR(32),
  description VARCHAR(32),
  is_cyber_bullying BOOLEAN,
  is_physical BOOLEAN,
  is_verbal BOOLEAN,
  incident_id VARCHAR(32),
  PRIMARY KEY (type_id),
  FOREIGN KEY (incident_id) REFERENCES bullying_incidents (incident_id)
);
