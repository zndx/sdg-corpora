CREATE TABLE t_labrun_with_protocol (
  id VARCHAR(255),
  labrun VARCHAR(255),
  follows_protocol VARCHAR(255) NOT NULL,
  end_time TIMESTAMP,
  retry_count INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (follows_protocol) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"labrun_with_protocol"}'
