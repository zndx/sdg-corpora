CREATE TABLE t_observation_precedes_other (
  id VARCHAR(255),
  observation VARCHAR(255),
  precedes VARCHAR(255) NOT NULL,
  end_time TIMESTAMP,
  retry_count INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (precedes) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"observation_precedes_other"}'
