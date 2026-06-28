CREATE TABLE t_radicalization_process (
  id VARCHAR(255),
  radicalization_process VARCHAR(255),
  has_participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"radicalization_process"}'
