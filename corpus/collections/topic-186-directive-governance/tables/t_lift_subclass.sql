CREATE TABLE t_lift_subclass (
  id VARCHAR(255),
  lift VARCHAR(255),
  of_attribute_set VARCHAR(255) NOT NULL,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (of_attribute_set) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"lift_subclass"}'
