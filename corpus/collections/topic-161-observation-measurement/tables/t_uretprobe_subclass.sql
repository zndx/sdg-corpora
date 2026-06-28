CREATE TABLE t_uretprobe_subclass (
  id VARCHAR(255),
  uretprobe VARCHAR(255),
  attaches_to_return_hook VARCHAR(255) NOT NULL,
  name VARCHAR(255),
  owner VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (attaches_to_return_hook) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"uretprobe_subclass"}'
