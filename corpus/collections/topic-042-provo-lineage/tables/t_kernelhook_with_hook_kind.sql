CREATE TABLE t_kernelhook_with_hook_kind (
  id VARCHAR(255),
  kernelhook VARCHAR(255),
  hook_kind VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  version INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (hook_kind) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"kernelhook_with_hook_kind"}'
