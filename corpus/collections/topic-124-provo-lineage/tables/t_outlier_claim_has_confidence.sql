CREATE TABLE t_outlier_claim_has_confidence (
  id VARCHAR(255),
  outlier VARCHAR(255),
  confidence VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (confidence) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"outlier_claim_has_confidence"}'
