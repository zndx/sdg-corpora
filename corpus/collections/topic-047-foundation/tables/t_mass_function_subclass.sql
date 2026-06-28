CREATE TABLE t_mass_function_subclass (
  id VARCHAR(255),
  mass VARCHAR(255),
  over_frame_of_discernment VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  method VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (over_frame_of_discernment) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"mass_function_subclass"}'
