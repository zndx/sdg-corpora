CREATE TABLE t_requirement_satisfies (
  id VARCHAR(255),
  requirement VARCHAR(255),
  satisfies VARCHAR(255) NOT NULL,
  priority INTEGER,
  scope VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (satisfies) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"requirement_satisfies"}'
