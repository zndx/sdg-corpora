CREATE TABLE t_annotation_governed_by_classification_policy (
  id VARCHAR(255),
  annotation VARCHAR(255),
  uncertainty DECIMAL(38,9),
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"annotation_governed_by_classification_policy"}'
