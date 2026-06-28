CREATE TABLE t_labrun_subclass (
  id VARCHAR(255),
  labrun VARCHAR(255),
  input_sample VARCHAR(255) NOT NULL,
  scheduled_at TIMESTAMP,
  triggered_by VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (input_sample) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"labrun_subclass"}'
