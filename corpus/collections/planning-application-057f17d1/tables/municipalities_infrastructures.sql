CREATE TABLE municipalities_infrastructures (
  municipality_id INTEGER NOT NULL,
  infrastructure_infra_id INTEGER NOT NULL,
  PRIMARY KEY (municipality_id, infrastructure_infra_id),
  FOREIGN KEY (municipality_id) REFERENCES municipalities (id),
  FOREIGN KEY (infrastructure_infra_id) REFERENCES infrastructures (infra_id)
);
