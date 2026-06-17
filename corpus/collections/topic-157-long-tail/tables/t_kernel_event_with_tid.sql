CREATE TABLE t_kernel_event_with_tid (
  id VARCHAR(255),
  subject VARCHAR(255),
  with_thread_id VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  end_time TIMESTAMP,
  start_time TIMESTAMP,
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (with_thread_id) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"kernel_event_with_tid"}'
