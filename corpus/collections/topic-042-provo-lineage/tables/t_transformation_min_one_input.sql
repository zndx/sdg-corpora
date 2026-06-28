CREATE TABLE t_transformation_min_one_input (
  id VARCHAR(255),
  transformation VARCHAR(255),
  input_dataset VARCHAR(255) NOT NULL,
  log_level VARCHAR(255),
  status VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"transformation_min_one_input"}'
