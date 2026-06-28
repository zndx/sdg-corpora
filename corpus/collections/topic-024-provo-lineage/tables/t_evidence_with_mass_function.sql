CREATE TABLE t_evidence_with_mass_function (
  id VARCHAR(255),
  evidence VARCHAR(255),
  mass_function VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  method VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (mass_function) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"evidence_with_mass_function"}'
