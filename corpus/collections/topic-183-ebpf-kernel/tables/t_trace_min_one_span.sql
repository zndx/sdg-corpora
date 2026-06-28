CREATE TABLE t_trace_min_one_span (
  id VARCHAR(255),
  trace VARCHAR(255),
  spans VARCHAR(255) NOT NULL,
  phase VARCHAR(255),
  start_time TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (spans) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"trace_min_one_span"}'
