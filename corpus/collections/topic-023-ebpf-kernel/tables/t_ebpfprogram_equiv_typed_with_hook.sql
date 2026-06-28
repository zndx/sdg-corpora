CREATE TABLE t_ebpfprogram_equiv_typed_with_hook (
  id VARCHAR(255),
  ebpfprogram VARCHAR(255),
  program_type VARCHAR(255) NOT NULL,
  attaches_to_hook VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  size_bytes BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (program_type) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":false,"template_id":"ebpfprogram_equiv_typed_with_hook"}'
