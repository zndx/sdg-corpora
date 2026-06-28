CREATE TABLE t_ebpfprogram_basic (
  id VARCHAR(255),
  ebpfprogram VARCHAR(255),
  name VARCHAR(255),
  owner VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":false,"template_id":"ebpfprogram_basic"}'
