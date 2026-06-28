CREATE TABLE t_transformation_governed_by (
  id VARCHAR(255),
  transformation VARCHAR(255),
  enforcement VARCHAR(255),
  review_cycle_days INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"transformation_governed_by"}'
