CREATE TABLE t_policy_equiv_jurisdiction_and_scope (
  id VARCHAR(255),
  subject VARCHAR(255),
  jurisdiction VARCHAR(255) NOT NULL,
  governs_scope VARCHAR(255) NOT NULL,
  effective_date DATE,
  mandatory BOOLEAN,
  priority INTEGER,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (jurisdiction) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":false,"template_id":"policy_equiv_jurisdiction_and_scope"}'
