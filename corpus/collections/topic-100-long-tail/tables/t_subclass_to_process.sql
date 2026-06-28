CREATE TABLE t_subclass_to_process (
  id VARCHAR(255),
  process VARCHAR(255),
  phase VARCHAR(255),
  triggered_by VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"01_foundation","is_complex":false,"template_id":"subclass_to_process"}'
