CREATE TABLE t_constraint_subclass (
  id VARCHAR(255),
  constraint VARCHAR(255),
  constrains VARCHAR(255) NOT NULL,
  priority INTEGER,
  review_cycle_days INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (constrains) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"01_foundation","is_complex":true,"template_id":"constraint_subclass"}'
