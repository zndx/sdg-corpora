CREATE TABLE t_mass_function_min_one_focal (
  id VARCHAR(255),
  mass VARCHAR(255),
  focal_element VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (focal_element) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"mass_function_min_one_focal"}'
