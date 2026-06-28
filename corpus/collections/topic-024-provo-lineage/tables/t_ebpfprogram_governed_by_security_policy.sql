CREATE TABLE t_ebpfprogram_governed_by_security_policy (
  id VARCHAR(255),
  ebpfprogram VARCHAR(255),
  created_date DATE,
  size_bytes BIGINT,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfprogram_governed_by_security_policy"}'
