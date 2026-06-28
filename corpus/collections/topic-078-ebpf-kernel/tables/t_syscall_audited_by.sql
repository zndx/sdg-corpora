CREATE TABLE t_syscall_audited_by (
  id VARCHAR(255),
  syscall VARCHAR(255),
  format VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"syscall_audited_by"}'
