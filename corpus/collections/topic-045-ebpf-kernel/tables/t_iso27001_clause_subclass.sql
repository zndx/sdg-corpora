CREATE TABLE t_iso27001_clause_subclass (
  id VARCHAR(255),
  iso VARCHAR(255),
  iso27001_clause VARCHAR(255) NOT NULL,
  effective_date DATE,
  scope VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (iso27001_clause) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"iso27001_clause_subclass"}'
