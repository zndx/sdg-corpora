CREATE TABLE t_dataset_under_audit (
  id VARCHAR(255),
  subject VARCHAR(255),
  duration_seconds DECIMAL(38,9),
  end_time TIMESTAMP,
  start_time TIMESTAMP,
  status VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"dataset_under_audit"}'
