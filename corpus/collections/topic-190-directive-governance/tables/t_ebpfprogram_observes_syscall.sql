CREATE TABLE t_ebpfprogram_observes_syscall (
  id VARCHAR(255),
  ebpfprogram VARCHAR(255),
  observes_syscall VARCHAR(255) NOT NULL,
  mime_type VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (observes_syscall) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfprogram_observes_syscall"}'
