CREATE TABLE t_syscall_basic (
  id VARCHAR(255),
  subject VARCHAR(255),
  code VARCHAR(255),
  format VARCHAR(255),
  issued_date DATE,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"04_ebpf_kernel","is_complex":false,"template_id":"syscall_basic"}'
