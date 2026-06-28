CREATE TABLE t_lift_with_baseline_rate (
  id VARCHAR(255),
  lift VARCHAR(255),
  baseline_rate VARCHAR(255) NOT NULL,
  method VARCHAR(255),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (baseline_rate) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"lift_with_baseline_rate"}'
