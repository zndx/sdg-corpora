CREATE TABLE t_baseline_for_metric (
  id VARCHAR(255),
  baseline VARCHAR(255),
  baseline_for VARCHAR(255) NOT NULL,
  unit VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (baseline_for) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"baseline_for_metric"}'
