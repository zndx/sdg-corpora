CREATE TABLE t_outlier_detection_basic (
  id VARCHAR(255),
  outlier VARCHAR(255),
  host_name VARCHAR(255),
  phase VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":false,"template_id":"outlier_detection_basic"}'
