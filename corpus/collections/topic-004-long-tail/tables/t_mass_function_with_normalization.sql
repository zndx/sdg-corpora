CREATE TABLE t_mass_function_with_normalization (
  id VARCHAR(255),
  mass VARCHAR(255),
  normalization_constant VARCHAR(255) NOT NULL,
  unit VARCHAR(255),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (normalization_constant) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"mass_function_with_normalization"}'
