CREATE TABLE t_profile_has_null_rate (
  id VARCHAR(255),
  profile VARCHAR(255),
  null_rate VARCHAR(255) NOT NULL,
  value DECIMAL(38,9),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (null_rate) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"profile_has_null_rate"}'
