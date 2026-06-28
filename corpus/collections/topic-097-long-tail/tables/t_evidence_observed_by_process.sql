CREATE TABLE t_evidence_observed_by_process (
  id VARCHAR(255),
  evidence VARCHAR(255),
  value DECIMAL(38,9),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"evidence_observed_by_process"}'
