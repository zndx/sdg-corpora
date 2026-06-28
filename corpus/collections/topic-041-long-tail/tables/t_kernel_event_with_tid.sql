CREATE TABLE t_kernel_event_with_tid (
  id VARCHAR(255),
  kernel VARCHAR(255),
  with_thread_id VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  retry_count INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (with_thread_id) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"kernel_event_with_tid"}'
