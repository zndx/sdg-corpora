CREATE TABLE t_plausibility_function_for (
  id VARCHAR(255),
  plausibility VARCHAR(255),
  plausibility_for_claim VARCHAR(255) NOT NULL,
  method VARCHAR(255),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (plausibility_for_claim) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"plausibility_function_for"}'
