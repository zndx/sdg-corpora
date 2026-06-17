CREATE TABLE t_requirement_only_satisfied_by (
  id VARCHAR(255),
  subject VARCHAR(255),
  satisfied_by VARCHAR(255),
  effective_date DATE,
  mandatory BOOLEAN,
  priority INTEGER,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (satisfied_by) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"requirement_only_satisfied_by"}'
