CREATE TABLE t_attestation_about_compliance_claim (
  id VARCHAR(255),
  attestation VARCHAR(255),
  confidence DECIMAL(38,9),
  encoding VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"attestation_about_compliance_claim"}'
