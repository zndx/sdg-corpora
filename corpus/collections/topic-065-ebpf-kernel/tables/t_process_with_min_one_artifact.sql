CREATE TABLE t_process_with_min_one_artifact (
  id VARCHAR(255),
  process VARCHAR(255),
  duration_seconds DECIMAL(38,9),
  exit_code INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"01_foundation","is_complex":true,"template_id":"process_with_min_one_artifact"}'
