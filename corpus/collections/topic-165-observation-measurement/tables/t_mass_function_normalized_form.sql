CREATE TABLE t_mass_function_normalized_form (
  id VARCHAR(255),
  mass VARCHAR(255),
  normalized_form VARCHAR(255) NOT NULL,
  value DECIMAL(38,9),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (normalized_form) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"mass_function_normalized_form"}'
