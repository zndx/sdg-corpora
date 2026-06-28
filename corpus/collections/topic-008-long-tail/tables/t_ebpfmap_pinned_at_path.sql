CREATE TABLE t_ebpfmap_pinned_at_path (
  id VARCHAR(255),
  ebpfmap VARCHAR(255),
  pinned_at_path VARCHAR(255) NOT NULL,
  owner VARCHAR(255),
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (pinned_at_path) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfmap_pinned_at_path"}'
