CREATE TABLE t_ebpfmap_with_max_entries (
  id VARCHAR(255),
  ebpfmap VARCHAR(255),
  max_entries VARCHAR(255) NOT NULL,
  uri VARCHAR(255),
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (max_entries) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfmap_with_max_entries"}'
