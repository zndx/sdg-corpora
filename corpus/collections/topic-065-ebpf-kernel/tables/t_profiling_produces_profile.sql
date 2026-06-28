CREATE TABLE t_profiling_produces_profile (
  id VARCHAR(255),
  profiling VARCHAR(255),
  produces VARCHAR(255) NOT NULL,
  log_level VARCHAR(255),
  phase VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (produces) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"profiling_produces_profile"}'
