CREATE TABLE t_mass_function_equiv_frame_and_assignment (
  id VARCHAR(255),
  subject VARCHAR(255),
  over_frame_of_discernment VARCHAR(255) NOT NULL,
  assigns_mass_to VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  recorded_at TIMESTAMP,
  unit VARCHAR(255),
  value DECIMAL(38,9),
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (over_frame_of_discernment) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":false,"template_id":"mass_function_equiv_frame_and_assignment"}'
