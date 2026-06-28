CREATE TABLE t_trace_originates_from (
  id VARCHAR(255),
  trace VARCHAR(255),
  originates_from VARCHAR(255) NOT NULL,
  log_level VARCHAR(255),
  phase VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (originates_from) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"trace_originates_from"}'
