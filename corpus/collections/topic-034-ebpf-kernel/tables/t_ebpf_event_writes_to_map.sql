CREATE TABLE t_ebpf_event_writes_to_map (
  id VARCHAR(255),
  ebpf VARCHAR(255),
  writes_to_map VARCHAR(255) NOT NULL,
  exit_code INTEGER,
  host_name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (writes_to_map) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"ebpf_event_writes_to_map"}'
