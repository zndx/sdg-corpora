CREATE TABLE t_constraint_evaluated_during (
  id VARCHAR(255),
  constraint VARCHAR(255),
  evaluated_during VARCHAR(255) NOT NULL,
  mandatory BOOLEAN,
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (evaluated_during) REFERENCES t_directive_only_governs(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"constraint_evaluated_during"}'
