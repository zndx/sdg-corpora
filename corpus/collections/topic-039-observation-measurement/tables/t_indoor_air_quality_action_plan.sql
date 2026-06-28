CREATE TABLE t_indoor_air_quality_action_plan (
  id VARCHAR(255),
  indoor_air_quality_action_plan VARCHAR(255),
  targets_pollution VARCHAR(255) NOT NULL,
  verified_by_metric VARCHAR(255) NOT NULL,
  priority INTEGER,
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"08_derived","is_complex":true,"template_id":"indoor_air_quality_action_plan"}'
