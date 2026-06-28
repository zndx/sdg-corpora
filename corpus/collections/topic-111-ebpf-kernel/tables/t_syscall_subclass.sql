CREATE TABLE t_syscall_subclass (
  id VARCHAR(255),
  syscall VARCHAR(255),
  in_syscall_subsystem VARCHAR(255) NOT NULL,
  checksum_algo VARCHAR(255),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (in_syscall_subsystem) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"syscall_subclass"}'
