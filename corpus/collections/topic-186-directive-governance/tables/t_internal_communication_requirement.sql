CREATE TABLE t_internal_communication_requirement (
  id VARCHAR(255),
  internal_communication_requirement VARCHAR(255),
  specifies_platform VARCHAR(255) NOT NULL,
  targets_goal VARCHAR(255) NOT NULL,
  review_cycle_days INTEGER,
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"08_derived","is_complex":true,"template_id":"internal_communication_requirement"}'
