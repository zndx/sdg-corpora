CREATE TABLE t_syscall_only_in_kernel_subsystem (
  id VARCHAR(255),
  syscall VARCHAR(255),
  in_syscall_subsystem VARCHAR(255),
  code VARCHAR(255),
  issued_date DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (in_syscall_subsystem) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"syscall_only_in_kernel_subsystem"}'
