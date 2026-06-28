CREATE TABLE t_outlier_detection_targets_dataset (
  id VARCHAR(255),
  outlier VARCHAR(255),
  scheduled_at TIMESTAMP,
  triggered_by VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"outlier_detection_targets_dataset"}'
