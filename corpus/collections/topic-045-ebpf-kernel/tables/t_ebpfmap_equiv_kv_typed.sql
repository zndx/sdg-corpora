CREATE TABLE t_ebpfmap_equiv_kv_typed (
  id VARCHAR(255),
  ebpfmap VARCHAR(255),
  key_type VARCHAR(255) NOT NULL,
  value_type_map VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  mime_type VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (key_type) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":false,"template_id":"ebpfmap_equiv_kv_typed"}'
