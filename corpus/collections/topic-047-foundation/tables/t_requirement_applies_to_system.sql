CREATE TABLE t_requirement_applies_to_system (
  id VARCHAR(255),
  requirement VARCHAR(255),
  priority INTEGER,
  review_cycle_days INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"03_directive_governance","is_complex":true,"template_id":"requirement_applies_to_system"}'
