CREATE TABLE objections_infrastructures (
  objection_id VARCHAR(44) NOT NULL,
  infrastructure_infra_id INTEGER NOT NULL,
  PRIMARY KEY (objection_id, infrastructure_infra_id),
  FOREIGN KEY (objection_id) REFERENCES public_objections (objection_id),
  FOREIGN KEY (infrastructure_infra_id) REFERENCES infrastructures (infra_id)
);
