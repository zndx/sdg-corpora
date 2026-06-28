CREATE TABLE t_audit_with_findings (
  id VARCHAR(255),
  audit VARCHAR(255),
  findings VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  host_name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (findings) REFERENCES t_subclass_to_process(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"audit_with_findings"}'
