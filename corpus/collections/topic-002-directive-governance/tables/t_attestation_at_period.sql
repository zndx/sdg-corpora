CREATE TABLE t_attestation_at_period (
  id VARCHAR(255),
  attestation VARCHAR(255),
  at_attestation_period VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (at_attestation_period) REFERENCES t_subclass_to_process(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"attestation_at_period"}'
