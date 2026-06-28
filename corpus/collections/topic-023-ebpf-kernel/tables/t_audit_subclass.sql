CREATE TABLE t_audit_subclass (
  id VARCHAR(255),
  audit VARCHAR(255),
  exit_code INTEGER,
  retry_count INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"audit_subclass"}'
