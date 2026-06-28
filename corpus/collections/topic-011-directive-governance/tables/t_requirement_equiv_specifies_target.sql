CREATE TABLE t_requirement_equiv_specifies_target (
  id VARCHAR(255),
  requirement VARCHAR(255),
  specifies VARCHAR(255) NOT NULL,
  applies_to VARCHAR(255) NOT NULL,
  effective_date DATE,
  mandatory BOOLEAN,
  PRIMARY KEY (id),
  FOREIGN KEY (specifies) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":false,"template_id":"requirement_equiv_specifies_target"}'
