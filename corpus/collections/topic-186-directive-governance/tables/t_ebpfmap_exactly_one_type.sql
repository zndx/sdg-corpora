CREATE TABLE t_ebpfmap_exactly_one_type (
  id VARCHAR(255),
  ebpfmap VARCHAR(255),
  map_type VARCHAR(255),
  checksum VARCHAR(255),
  uri VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (map_type) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfmap_exactly_one_type"}'
