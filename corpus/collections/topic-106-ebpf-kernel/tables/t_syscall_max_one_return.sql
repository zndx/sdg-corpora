CREATE TABLE t_syscall_max_one_return (
  id VARCHAR(255),
  syscall VARCHAR(255),
  return_type VARCHAR(255),
  checksum_algo VARCHAR(255),
  namespace VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (return_type) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"syscall_max_one_return"}'
