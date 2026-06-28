CREATE TABLE t_conceptual_construction_process (
  id VARCHAR(255),
  conceptual_construction_process VARCHAR(255),
  transforms_subject VARCHAR(255) NOT NULL,
  generates_predicate VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"conceptual_construction_process"}'
