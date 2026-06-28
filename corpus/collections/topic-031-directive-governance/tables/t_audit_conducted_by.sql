CREATE TABLE t_audit_conducted_by (
  id VARCHAR(255),
  audit VARCHAR(255),
  log_level VARCHAR(255),
  start_time TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"audit_conducted_by"}'
