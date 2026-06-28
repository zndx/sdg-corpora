CREATE TABLE t_trace_with_service_name (
  id VARCHAR(255),
  trace VARCHAR(255),
  service_name VARCHAR(255) NOT NULL,
  checksum VARCHAR(255),
  created_date DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (service_name) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"trace_with_service_name"}'
