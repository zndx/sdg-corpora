CREATE TABLE t_requirement_equiv_specifies_target (
  id VARCHAR(255),
  subject VARCHAR(255),
  specifies VARCHAR(255) NOT NULL,
  applies_to VARCHAR(255) NOT NULL,
  effective_date DATE,
  mandatory BOOLEAN,
  priority INTEGER,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (specifies) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":false,"template_id":"requirement_equiv_specifies_target"}'
