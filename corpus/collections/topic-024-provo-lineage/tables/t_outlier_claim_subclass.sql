CREATE TABLE t_outlier_claim_subclass (
  id VARCHAR(255),
  outlier VARCHAR(255),
  explains_anomaly_in VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  dimension_kind VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (explains_anomaly_in) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"outlier_claim_subclass"}'
