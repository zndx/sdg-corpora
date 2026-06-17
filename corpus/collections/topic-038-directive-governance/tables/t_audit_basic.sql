CREATE TABLE t_audit_basic (
  id VARCHAR(255),
  subject VARCHAR(255),
  duration_seconds DECIMAL(38,9),
  end_time TIMESTAMP,
  start_time TIMESTAMP,
  status VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":false,"template_id":"audit_basic"}'
