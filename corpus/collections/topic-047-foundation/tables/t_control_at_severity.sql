CREATE TABLE t_control_at_severity (
  id VARCHAR(255),
  control VARCHAR(255),
  at_severity VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (at_severity) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"control_at_severity"}'
