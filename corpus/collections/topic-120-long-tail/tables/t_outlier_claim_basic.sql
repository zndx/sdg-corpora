CREATE TABLE t_outlier_claim_basic (
  id VARCHAR(255),
  outlier VARCHAR(255),
  recorded_at TIMESTAMP,
  encoding VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":false,"template_id":"outlier_claim_basic"}'
