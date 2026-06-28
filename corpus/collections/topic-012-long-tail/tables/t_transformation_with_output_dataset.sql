CREATE TABLE t_transformation_with_output_dataset (
  id VARCHAR(255),
  transformation VARCHAR(255),
  output_dataset VARCHAR(255) NOT NULL,
  log_level VARCHAR(255),
  triggered_by VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"transformation_with_output_dataset"}'
