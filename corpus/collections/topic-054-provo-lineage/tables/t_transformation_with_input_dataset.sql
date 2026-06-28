CREATE TABLE t_transformation_with_input_dataset (
  id VARCHAR(255),
  transformation VARCHAR(255),
  input_dataset VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  retry_count INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"transformation_with_input_dataset"}'
