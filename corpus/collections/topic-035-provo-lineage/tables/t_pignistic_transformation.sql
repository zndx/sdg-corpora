CREATE TABLE t_pignistic_transformation (
  id VARCHAR(255),
  pignistic VARCHAR(255),
  pignistic_transform VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (pignistic_transform) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"pignistic_transformation"}'
