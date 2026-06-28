CREATE TABLE t_belief_function_for (
  id VARCHAR(255),
  belief VARCHAR(255),
  belief_for_claim VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (belief_for_claim) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"belief_function_for"}'
