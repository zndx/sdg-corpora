CREATE TABLE t_kernelhook_for_subsystem (
  id VARCHAR(255),
  kernelhook VARCHAR(255),
  for_kernel_subsystem VARCHAR(255) NOT NULL,
  license VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (for_kernel_subsystem) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"kernelhook_for_subsystem"}'
