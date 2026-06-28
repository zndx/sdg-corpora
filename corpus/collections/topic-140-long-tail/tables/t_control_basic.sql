CREATE TABLE t_control_basic (
  id VARCHAR(255),
  control VARCHAR(255),
  effective_date DATE,
  mandatory BOOLEAN,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":false,"template_id":"control_basic"}'
