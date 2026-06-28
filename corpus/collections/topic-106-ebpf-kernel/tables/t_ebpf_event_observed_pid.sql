CREATE TABLE t_ebpf_event_observed_pid (
  id VARCHAR(255),
  ebpf VARCHAR(255),
  observes_pid VARCHAR(255) NOT NULL,
  retry_count INTEGER,
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (observes_pid) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"ebpf_event_observed_pid"}'
