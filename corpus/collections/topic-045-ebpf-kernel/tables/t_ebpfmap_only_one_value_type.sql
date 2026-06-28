CREATE TABLE t_ebpfmap_only_one_value_type (
  id VARCHAR(255),
  ebpfmap VARCHAR(255),
  value_type_map VARCHAR(255),
  size_bytes BIGINT,
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (value_type_map) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfmap_only_one_value_type"}'
