CREATE TABLE t_kernel_event_with_pid (
  id VARCHAR(255),
  kernel VARCHAR(255),
  with_process_id VARCHAR(255) NOT NULL,
  host_name VARCHAR(255),
  log_level VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (with_process_id) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"kernel_event_with_pid"}'
