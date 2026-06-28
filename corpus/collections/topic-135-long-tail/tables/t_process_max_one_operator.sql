CREATE TABLE t_process_max_one_operator (
  id VARCHAR(255),
  process VARCHAR(255),
  operator VARCHAR(255),
  retry_count INTEGER,
  start_time TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (operator) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"process_max_one_operator"}'
