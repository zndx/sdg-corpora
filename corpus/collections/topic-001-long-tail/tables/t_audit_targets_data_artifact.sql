CREATE TABLE t_audit_targets_data_artifact (
  id VARCHAR(255),
  audit VARCHAR(255),
  retry_count INTEGER,
  status VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"03_directive_governance","is_complex":true,"template_id":"audit_targets_data_artifact"}'
