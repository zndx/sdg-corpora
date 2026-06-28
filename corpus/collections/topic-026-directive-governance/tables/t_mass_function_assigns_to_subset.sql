CREATE TABLE t_mass_function_assigns_to_subset (
  id VARCHAR(255),
  mass VARCHAR(255),
  assigns_mass_to VARCHAR(255) NOT NULL,
  value DECIMAL(38,9),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (assigns_mass_to) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"mass_function_assigns_to_subset"}'
