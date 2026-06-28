CREATE TABLE t_annotation_only_about_artifact (
  id VARCHAR(255),
  annotation VARCHAR(255),
  recorded_at TIMESTAMP,
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"annotation_only_about_artifact"}'
