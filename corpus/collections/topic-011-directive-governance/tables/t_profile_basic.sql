CREATE TABLE t_profile_basic (
  id VARCHAR(255),
  profile VARCHAR(255),
  uncertainty DECIMAL(38,9),
  encoding VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":false,"template_id":"profile_basic"}'
