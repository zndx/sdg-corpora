CREATE TABLE t_dempster_combines_audit_evidences (
  id VARCHAR(255),
  dempster VARCHAR(255),
  confidence DECIMAL(38,9),
  recorded_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"dempster_combines_audit_evidences"}'
