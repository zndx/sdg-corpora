CREATE TABLE t_control_with_owner (
  id VARCHAR(255),
  control VARCHAR(255),
  mandatory BOOLEAN,
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"control_with_owner"}'
