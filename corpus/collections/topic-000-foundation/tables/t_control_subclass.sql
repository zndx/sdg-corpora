CREATE TABLE t_control_subclass (
  id VARCHAR(255),
  control VARCHAR(255),
  mitigates VARCHAR(255) NOT NULL,
  scope VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (mitigates) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"control_subclass"}'
