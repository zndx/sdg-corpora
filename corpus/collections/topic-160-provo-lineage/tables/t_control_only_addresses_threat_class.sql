CREATE TABLE t_control_only_addresses_threat_class (
  id VARCHAR(255),
  subject VARCHAR(255),
  addresses_risk VARCHAR(255),
  effective_date DATE,
  mandatory BOOLEAN,
  priority INTEGER,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (addresses_risk) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"control_only_addresses_threat_class"}'
