CREATE TABLE t_ebpfmap_with_key_type (
  id VARCHAR(255),
  ebpfmap VARCHAR(255),
  key_type VARCHAR(255) NOT NULL,
  owner VARCHAR(255),
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (key_type) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfmap_with_key_type"}'
