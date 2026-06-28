CREATE TABLE t_observation_records_state (
  id VARCHAR(255),
  observation VARCHAR(255),
  records VARCHAR(255) NOT NULL,
  retry_count INTEGER,
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (records) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"observation_records_state"}'
