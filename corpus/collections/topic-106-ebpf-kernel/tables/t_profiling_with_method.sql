CREATE TABLE t_profiling_with_method (
  id VARCHAR(255),
  profiling VARCHAR(255),
  applies_method VARCHAR(255) NOT NULL,
  phase VARCHAR(255),
  triggered_by VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (applies_method) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"profiling_with_method"}'
