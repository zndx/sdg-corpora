CREATE TABLE t_profile_of_column (
  id VARCHAR(255),
  profile VARCHAR(255),
  about VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (about) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"profile_of_column"}'
