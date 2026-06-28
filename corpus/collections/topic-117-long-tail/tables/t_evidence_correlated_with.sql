CREATE TABLE t_evidence_correlated_with (
  id VARCHAR(255),
  evidence VARCHAR(255),
  evidence_correlated_with VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (evidence_correlated_with) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"evidence_correlated_with"}'
