CREATE TABLE t_ebpfprogram_verified_safe (
  id VARCHAR(255),
  ebpfprogram VARCHAR(255),
  verified_safe_by VARCHAR(255) NOT NULL,
  created_date DATE,
  uri VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (verified_safe_by) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfprogram_verified_safe"}'
