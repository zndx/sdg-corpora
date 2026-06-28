CREATE TABLE t_syscall_basic (
  id VARCHAR(255),
  syscall VARCHAR(255),
  code VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"04_ebpf_kernel","is_complex":false,"template_id":"syscall_basic"}'
