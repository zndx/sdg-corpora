CREATE TABLE t_profile_over_time_window (
  id VARCHAR(255),
  profile VARCHAR(255),
  over_time_window VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (over_time_window) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"profile_over_time_window"}'
