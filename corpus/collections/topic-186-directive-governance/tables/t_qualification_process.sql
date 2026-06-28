CREATE TABLE t_qualification_process (
  id VARCHAR(255),
  qualification_process VARCHAR(255),
  requires_membership VARCHAR(255) NOT NULL,
  yields_championship_entry VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"qualification_process"}'
