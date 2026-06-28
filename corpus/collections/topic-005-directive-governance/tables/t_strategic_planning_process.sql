CREATE TABLE t_strategic_planning_process (
  id VARCHAR(255),
  strategic_planning_process VARCHAR(255),
  targets_business_division VARCHAR(255) NOT NULL,
  produces_planning_artifact VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"strategic_planning_process"}'
