CREATE TABLE t_outlier_claim_min_one_attribute (
  id VARCHAR(255),
  outlier VARCHAR(255),
  attribute_set VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (attribute_set) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"outlier_claim_min_one_attribute"}'
