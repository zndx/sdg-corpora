CREATE TABLE t_tc_classifier_subclass (
  id VARCHAR(255),
  classifier VARCHAR(255),
  t_c_direction VARCHAR(255) NOT NULL,
  created_date DATE,
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (t_c_direction) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"tc_classifier_subclass"}'
