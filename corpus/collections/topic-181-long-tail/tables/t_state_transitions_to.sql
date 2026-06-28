CREATE TABLE t_state_transitions_to (
  id VARCHAR(255),
  state VARCHAR(255),
  transitions_to VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (transitions_to) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"state_transitions_to"}'
