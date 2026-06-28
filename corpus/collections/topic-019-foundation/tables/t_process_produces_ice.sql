CREATE TABLE t_process_produces_ice (
  id VARCHAR(255),
  process VARCHAR(255),
  exit_code INTEGER,
  log_level VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"01_foundation","is_complex":true,"template_id":"process_produces_ice"}'
