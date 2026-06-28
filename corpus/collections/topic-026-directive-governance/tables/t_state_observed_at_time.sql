CREATE TABLE t_state_observed_at_time (
  id VARCHAR(255),
  state VARCHAR(255),
  observed_at VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (observed_at) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"state_observed_at_time"}'
