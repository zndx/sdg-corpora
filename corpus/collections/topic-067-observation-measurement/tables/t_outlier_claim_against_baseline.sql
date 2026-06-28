CREATE TABLE t_outlier_claim_against_baseline (
  id VARCHAR(255),
  outlier VARCHAR(255),
  against VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (against) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"outlier_claim_against_baseline"}'
