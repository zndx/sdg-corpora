CREATE TABLE t_syscall_with_argument_count (
  id VARCHAR(255),
  syscall VARCHAR(255),
  argument_count VARCHAR(255) NOT NULL,
  namespace VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (argument_count) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"syscall_with_argument_count"}'
