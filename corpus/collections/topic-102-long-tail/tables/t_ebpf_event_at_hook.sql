CREATE TABLE t_ebpf_event_at_hook (
  id VARCHAR(255),
  ebpf VARCHAR(255),
  at_hook VARCHAR(255) NOT NULL,
  exit_code INTEGER,
  triggered_by VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (at_hook) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"ebpf_event_at_hook"}'
