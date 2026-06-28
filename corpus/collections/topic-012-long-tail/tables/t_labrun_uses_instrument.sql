CREATE TABLE t_labrun_uses_instrument (
  id VARCHAR(255),
  labrun VARCHAR(255),
  uses VARCHAR(255) NOT NULL,
  phase VARCHAR(255),
  start_time TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (uses) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"labrun_uses_instrument"}'
