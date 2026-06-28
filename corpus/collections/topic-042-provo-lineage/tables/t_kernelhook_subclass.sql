CREATE TABLE t_kernelhook_subclass (
  id VARCHAR(255),
  kernelhook VARCHAR(255),
  at_kernel_function VARCHAR(255) NOT NULL,
  size_bytes BIGINT,
  uri VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (at_kernel_function) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"kernelhook_subclass"}'
