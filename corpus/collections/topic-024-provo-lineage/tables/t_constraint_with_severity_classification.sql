CREATE TABLE t_constraint_with_severity_classification (
  id VARCHAR(255),
  constraint VARCHAR(255),
  severity VARCHAR(255) NOT NULL,
  priority INTEGER,
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (severity) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"constraint_with_severity_classification"}'
