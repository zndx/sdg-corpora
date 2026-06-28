CREATE TABLE t_quality_assurance_initiative (
  id VARCHAR(255),
  quality VARCHAR(255),
  targets VARCHAR(255) NOT NULL,
  involves VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"quality_assurance_initiative"}'
