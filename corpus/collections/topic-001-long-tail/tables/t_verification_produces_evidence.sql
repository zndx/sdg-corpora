CREATE TABLE t_verification_produces_evidence (
  id VARCHAR(255),
  verification VARCHAR(255),
  produces_evidence VARCHAR(255) NOT NULL,
  exit_code INTEGER,
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (produces_evidence) REFERENCES t_subclass_to_process(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"verification_produces_evidence"}'
