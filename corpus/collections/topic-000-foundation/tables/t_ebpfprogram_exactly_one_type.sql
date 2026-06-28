CREATE TABLE t_ebpfprogram_exactly_one_type (
  id VARCHAR(255),
  ebpfprogram VARCHAR(255),
  program_type VARCHAR(255),
  mime_type VARCHAR(255),
  owner VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (program_type) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfprogram_exactly_one_type"}'
