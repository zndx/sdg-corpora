CREATE TABLE t_kernelhook_in_kernel_module (
  id VARCHAR(255),
  kernelhook VARCHAR(255),
  in_kernel_module VARCHAR(255) NOT NULL,
  license VARCHAR(255),
  location VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (in_kernel_module) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"kernelhook_in_kernel_module"}'
