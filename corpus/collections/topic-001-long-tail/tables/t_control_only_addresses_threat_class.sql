CREATE TABLE t_control_only_addresses_threat_class (
  id VARCHAR(255),
  control VARCHAR(255),
  addresses_risk VARCHAR(255),
  review_cycle_days INTEGER,
  scope VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (addresses_risk) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"control_only_addresses_threat_class"}'
