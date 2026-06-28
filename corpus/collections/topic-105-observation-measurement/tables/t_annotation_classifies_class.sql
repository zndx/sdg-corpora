CREATE TABLE t_annotation_classifies_class (
  id VARCHAR(255),
  annotation VARCHAR(255),
  classifies VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (classifies) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"annotation_classifies_class"}'
