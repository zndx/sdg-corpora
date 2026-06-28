CREATE TABLE t_transformation_min_one_output (
  id VARCHAR(255),
  transformation VARCHAR(255),
  output_dataset VARCHAR(255) NOT NULL,
  retry_count INTEGER,
  triggered_by VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"transformation_min_one_output"}'
