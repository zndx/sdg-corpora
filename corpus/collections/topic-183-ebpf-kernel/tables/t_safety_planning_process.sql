CREATE TABLE t_safety_planning_process (
  id VARCHAR(255),
  safety_planning_process VARCHAR(255),
  targets VARCHAR(255) NOT NULL,
  employs VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"safety_planning_process"}'
