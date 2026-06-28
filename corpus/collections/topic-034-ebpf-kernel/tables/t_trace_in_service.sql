CREATE TABLE t_trace_in_service (
  id VARCHAR(255),
  trace VARCHAR(255),
  in_service VARCHAR(255) NOT NULL,
  exit_code INTEGER,
  host_name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (in_service) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"trace_in_service"}'
