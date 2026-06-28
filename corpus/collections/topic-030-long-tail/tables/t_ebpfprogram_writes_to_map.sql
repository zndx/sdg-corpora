CREATE TABLE t_ebpfprogram_writes_to_map (
  id VARCHAR(255),
  ebpfprogram VARCHAR(255),
  writes_to_map VARCHAR(255) NOT NULL,
  size_bytes BIGINT,
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (writes_to_map) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfprogram_writes_to_map"}'
