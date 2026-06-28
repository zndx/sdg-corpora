CREATE TABLE t_constraint_with_violation_consequence (
  id VARCHAR(255),
  constraint VARCHAR(255),
  constrains VARCHAR(255) NOT NULL,
  on_violation VARCHAR(255) NOT NULL,
  mandatory BOOLEAN,
  scope VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (constrains) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"01_foundation","is_complex":true,"template_id":"constraint_with_violation_consequence"}'
