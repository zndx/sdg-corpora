CREATE TABLE t_state_transitions_from (
  id VARCHAR(255),
  state VARCHAR(255),
  transitions_from VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  unit VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (transitions_from) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"state_transitions_from"}'
