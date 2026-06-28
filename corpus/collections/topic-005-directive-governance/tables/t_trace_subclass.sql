CREATE TABLE t_trace_subclass (
  id VARCHAR(255),
  trace VARCHAR(255),
  spans VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (spans) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"trace_subclass"}'
