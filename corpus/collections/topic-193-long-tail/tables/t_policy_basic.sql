CREATE TABLE t_policy_basic (
  id VARCHAR(255),
  subject VARCHAR(255),
  effective_date DATE,
  mandatory BOOLEAN,
  priority INTEGER,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":false,"template_id":"policy_basic"}'
