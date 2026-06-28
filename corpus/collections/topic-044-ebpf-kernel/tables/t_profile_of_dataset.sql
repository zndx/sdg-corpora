CREATE TABLE t_profile_of_dataset (
  id VARCHAR(255),
  profile VARCHAR(255),
  confidence DECIMAL(38,9),
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"profile_of_dataset"}'
