CREATE TABLE t_evidence_independent_or_correlated (
  id VARCHAR(255),
  evidence VARCHAR(255),
  evidence_2 VARCHAR(255),
  evidence_3 VARCHAR(255),
  method VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"evidence_independent_or_correlated"}'
