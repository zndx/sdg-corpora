CREATE TABLE t_process_uses_artifact (
  id VARCHAR(255),
  process VARCHAR(255),
  retry_count INTEGER,
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"01_foundation","is_complex":true,"template_id":"process_uses_artifact"}'
