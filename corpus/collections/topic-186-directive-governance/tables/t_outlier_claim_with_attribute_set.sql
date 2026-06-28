CREATE TABLE t_outlier_claim_with_attribute_set (
  id VARCHAR(255),
  outlier VARCHAR(255),
  attribute_set VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (attribute_set) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"outlier_claim_with_attribute_set"}'
