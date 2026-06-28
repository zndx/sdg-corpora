CREATE TABLE t_process_either_started_or_completed (
  id VARCHAR(255),
  process VARCHAR(255),
  process_2 VARCHAR(255),
  process_3 VARCHAR(255),
  duration_seconds DECIMAL(38,9),
  start_time TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"process_either_started_or_completed"}'
