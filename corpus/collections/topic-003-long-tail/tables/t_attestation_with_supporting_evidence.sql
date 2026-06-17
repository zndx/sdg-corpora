CREATE TABLE t_attestation_with_supporting_evidence (
  id VARCHAR(255),
  subject VARCHAR(255),
  with_supporting_evidence VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  end_time TIMESTAMP,
  start_time TIMESTAMP,
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (with_supporting_evidence) REFERENCES t_subclass_to_process(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"attestation_with_supporting_evidence"}'
