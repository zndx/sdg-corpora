CREATE TABLE t_policy_subclass (
  id VARCHAR(255),
  policy VARCHAR(255),
  governs VARCHAR(255) NOT NULL,
  priority INTEGER,
  scope VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (governs) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"01_foundation","is_complex":true,"template_id":"policy_subclass"}'
