CREATE TABLE t_ebpfprogram_union_kprobe_or_xdp (
  id VARCHAR(255),
  ebpfprogram VARCHAR(255),
  ebpfprogram_2 VARCHAR(255),
  ebpfprogram_3 VARCHAR(255),
  mime_type VARCHAR(255),
  size_bytes BIGINT,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfprogram_union_kprobe_or_xdp"}'
