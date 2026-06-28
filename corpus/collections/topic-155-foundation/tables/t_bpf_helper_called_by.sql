CREATE TABLE t_bpf_helper_called_by (
  id VARCHAR(255),
  bpf VARCHAR(255),
  called_by_program VARCHAR(255) NOT NULL,
  version INTEGER,
  owner VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (called_by_program) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"bpf_helper_called_by"}'
