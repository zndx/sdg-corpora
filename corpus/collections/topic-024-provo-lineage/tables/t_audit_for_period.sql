CREATE TABLE t_audit_for_period (
  id VARCHAR(255),
  audit VARCHAR(255),
  for_audit_period VARCHAR(255) NOT NULL,
  exit_code INTEGER,
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (for_audit_period) REFERENCES t_subclass_to_process(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"audit_for_period"}'
