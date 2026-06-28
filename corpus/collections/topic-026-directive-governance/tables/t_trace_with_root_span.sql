CREATE TABLE t_trace_with_root_span (
  id VARCHAR(255),
  trace VARCHAR(255),
  root_span VARCHAR(255) NOT NULL,
  checksum VARCHAR(255),
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (root_span) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"trace_with_root_span"}'
