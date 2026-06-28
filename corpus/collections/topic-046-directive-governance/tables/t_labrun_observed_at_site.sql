CREATE TABLE t_labrun_observed_at_site (
  id VARCHAR(255),
  labrun VARCHAR(255),
  occurs_in VARCHAR(255) NOT NULL,
  phase VARCHAR(255),
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (occurs_in) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"labrun_observed_at_site"}'
