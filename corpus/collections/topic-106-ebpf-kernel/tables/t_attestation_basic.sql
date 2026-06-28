CREATE TABLE t_attestation_basic (
  id VARCHAR(255),
  attestation VARCHAR(255),
  retry_count INTEGER,
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":false,"template_id":"attestation_basic"}'
