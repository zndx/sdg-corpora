CREATE TABLE t_requirement_refines (
  id VARCHAR(255),
  requirement VARCHAR(255),
  refines VARCHAR(255) NOT NULL,
  scope VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (refines) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"requirement_refines"}'
