CREATE TABLE t_bpf_helper_subclass (
  id VARCHAR(255),
  bpf VARCHAR(255),
  b_p_f_helper_function VARCHAR(255) NOT NULL,
  location VARCHAR(255),
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (b_p_f_helper_function) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"bpf_helper_subclass"}'
