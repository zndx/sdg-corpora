CREATE TABLE t_ebpfprogram_with_license (
  id VARCHAR(255),
  ebpfprogram VARCHAR(255),
  license VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (license) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfprogram_with_license"}'
