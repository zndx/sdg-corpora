CREATE TABLE t_requirement_basic (
  id VARCHAR(255),
  requirement VARCHAR(255),
  effective_date DATE,
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":false,"template_id":"requirement_basic"}'
