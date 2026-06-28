CREATE TABLE t_control_equiv_implements_with_owner (
  id VARCHAR(255),
  control VARCHAR(255),
  implements VARCHAR(255) NOT NULL,
  enforcement VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (implements) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":false,"template_id":"control_equiv_implements_with_owner"}'
