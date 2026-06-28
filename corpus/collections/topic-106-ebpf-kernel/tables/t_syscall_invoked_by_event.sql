CREATE TABLE t_syscall_invoked_by_event (
  id VARCHAR(255),
  syscall VARCHAR(255),
  invoked_by_event VARCHAR(255) NOT NULL,
  checksum_algo VARCHAR(255),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (invoked_by_event) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"syscall_invoked_by_event"}'
