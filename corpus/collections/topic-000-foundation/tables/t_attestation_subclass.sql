CREATE TABLE t_attestation_subclass (
  id VARCHAR(255),
  attestation VARCHAR(255),
  exit_code INTEGER,
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"attestation_subclass"}'
