CREATE TABLE t_dataset_under_audit (
  id VARCHAR(255),
  dataset VARCHAR(255),
  end_time TIMESTAMP,
  phase VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"dataset_under_audit"}'
