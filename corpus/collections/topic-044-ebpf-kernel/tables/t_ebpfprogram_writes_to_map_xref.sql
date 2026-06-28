CREATE TABLE t_ebpfprogram_writes_to_map_xref (
  id VARCHAR(255),
  ebpfprogram VARCHAR(255),
  size_bytes BIGINT,
  name VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfprogram_writes_to_map_xref"}'
