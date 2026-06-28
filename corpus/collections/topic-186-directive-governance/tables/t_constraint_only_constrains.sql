CREATE TABLE t_constraint_only_constrains (
  id VARCHAR(255),
  constraint VARCHAR(255),
  constrains VARCHAR(255),
  encoding VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (constrains) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"01_foundation","is_complex":true,"template_id":"constraint_only_constrains"}'
