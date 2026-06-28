CREATE TABLE t_attestation_signed_by (
  id VARCHAR(255),
  attestation VARCHAR(255),
  host_name VARCHAR(255),
  phase VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"attestation_signed_by"}'
