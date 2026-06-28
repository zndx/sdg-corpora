CREATE TABLE t_attestation_min_one_signer (
  id VARCHAR(255),
  attestation VARCHAR(255),
  phase VARCHAR(255),
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"attestation_min_one_signer"}'
