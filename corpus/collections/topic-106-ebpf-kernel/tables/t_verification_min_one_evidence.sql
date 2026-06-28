CREATE TABLE t_verification_min_one_evidence (
  id VARCHAR(255),
  verification VARCHAR(255),
  produces_evidence VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  log_level VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (produces_evidence) REFERENCES t_subclass_to_process(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"verification_min_one_evidence"}'
