CREATE TABLE t_evidence_independent_of (
  id VARCHAR(255),
  evidence VARCHAR(255),
  evidence_independent_of VARCHAR(255) NOT NULL,
  method VARCHAR(255),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (evidence_independent_of) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"evidence_independent_of"}'
