CREATE TABLE t_profile_has_cardinality (
  id VARCHAR(255),
  profile VARCHAR(255),
  cardinality VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (cardinality) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"profile_has_cardinality"}'
