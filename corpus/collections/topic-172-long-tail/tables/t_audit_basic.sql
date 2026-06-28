CREATE TABLE t_audit_basic (
  id VARCHAR(255),
  audit VARCHAR(255),
  log_level VARCHAR(255),
  triggered_by VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":false,"template_id":"audit_basic"}'
