CREATE TABLE t_process_min_one_input (
  id VARCHAR(255),
  process VARCHAR(255),
  input VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  log_level VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (input) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"process_min_one_input"}'
