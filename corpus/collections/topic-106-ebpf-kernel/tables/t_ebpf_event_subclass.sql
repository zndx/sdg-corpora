CREATE TABLE t_ebpf_event_subclass (
  id VARCHAR(255),
  ebpf VARCHAR(255),
  captured_by VARCHAR(255) NOT NULL,
  log_level VARCHAR(255),
  phase VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (captured_by) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"ebpf_event_subclass"}'
