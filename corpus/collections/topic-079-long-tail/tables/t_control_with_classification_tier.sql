CREATE TABLE t_control_with_classification_tier (
  id VARCHAR(255),
  control VARCHAR(255),
  effective_date DATE,
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"control_with_classification_tier"}'
