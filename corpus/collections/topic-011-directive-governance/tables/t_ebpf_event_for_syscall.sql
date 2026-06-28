CREATE TABLE t_ebpf_event_for_syscall (
  id VARCHAR(255),
  ebpf VARCHAR(255),
  for_syscall VARCHAR(255) NOT NULL,
  end_time TIMESTAMP,
  triggered_by VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (for_syscall) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"ebpf_event_for_syscall"}'
