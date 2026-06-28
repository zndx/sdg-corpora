CREATE TABLE t_labrun_has_operator (
  id VARCHAR(255),
  labrun VARCHAR(255),
  operator VARCHAR(255) NOT NULL,
  end_time TIMESTAMP,
  triggered_by VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (operator) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"labrun_has_operator"}'
