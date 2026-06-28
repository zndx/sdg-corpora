CREATE TABLE t_control_with_evidence_requirement (
  id VARCHAR(255),
  control VARCHAR(255),
  requires_evidence VARCHAR(255) NOT NULL,
  enforcement VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (requires_evidence) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"control_with_evidence_requirement"}'
