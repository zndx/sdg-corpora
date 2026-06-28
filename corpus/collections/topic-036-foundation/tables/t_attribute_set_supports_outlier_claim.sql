CREATE TABLE t_attribute_set_supports_outlier_claim (
  id VARCHAR(255),
  attribute VARCHAR(255),
  supports VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (supports) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"attribute_set_supports_outlier_claim"}'
