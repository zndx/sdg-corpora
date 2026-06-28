CREATE TABLE t_profile_has_distribution (
  id VARCHAR(255),
  profile VARCHAR(255),
  distribution VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  unit VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (distribution) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"profile_has_distribution"}'
