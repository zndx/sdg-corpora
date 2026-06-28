CREATE TABLE t_evidence_for_audit (
  id VARCHAR(255),
  evidence VARCHAR(255),
  confidence DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"evidence_for_audit"}'
