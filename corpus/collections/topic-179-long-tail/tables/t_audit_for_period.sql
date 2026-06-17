CREATE TABLE t_audit_for_period (
  id VARCHAR(255),
  subject VARCHAR(255),
  for_audit_period VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  end_time TIMESTAMP,
  start_time TIMESTAMP,
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (for_audit_period) REFERENCES t_subclass_to_process(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"audit_for_period"}'
