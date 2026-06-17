CREATE TABLE t_requirement_has_priority (
  id VARCHAR(255),
  subject VARCHAR(255),
  priority VARCHAR(255) NOT NULL,
  effective_date DATE,
  mandatory BOOLEAN,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (priority) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"requirement_has_priority"}'
