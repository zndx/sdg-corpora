CREATE TABLE t_annotation_assigned_by (
  id VARCHAR(255),
  annotation VARCHAR(255),
  assigned_by VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  method VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (assigned_by) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"annotation_assigned_by"}'
