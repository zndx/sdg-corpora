CREATE TABLE t_transformation_equiv_io_intersection (
  id VARCHAR(255),
  transformation VARCHAR(255),
  input_dataset VARCHAR(255) NOT NULL,
  output_dataset VARCHAR(255) NOT NULL,
  phase VARCHAR(255),
  status VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":false,"template_id":"transformation_equiv_io_intersection"}'
