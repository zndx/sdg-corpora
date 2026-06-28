CREATE TABLE t_outlier_claim_supported_by_lift (
  id VARCHAR(255),
  outlier VARCHAR(255),
  supported_by VARCHAR(255) NOT NULL,
  attribute_set VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (supported_by) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"outlier_claim_supported_by_lift"}'
