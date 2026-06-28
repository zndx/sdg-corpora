CREATE TABLE t_ebpfmap_with_value_type (
  id VARCHAR(255),
  ebpfmap VARCHAR(255),
  value_type_map VARCHAR(255) NOT NULL,
  mime_type VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (value_type_map) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfmap_with_value_type"}'
