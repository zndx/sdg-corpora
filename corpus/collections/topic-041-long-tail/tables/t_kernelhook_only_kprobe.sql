CREATE TABLE t_kernelhook_only_kprobe (
  id VARCHAR(255),
  kernelhook VARCHAR(255),
  hook_kind VARCHAR(255),
  version INTEGER,
  location VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (hook_kind) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"kernelhook_only_kprobe"}'
