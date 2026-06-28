CREATE TABLE t_syscall_traceable (
  id VARCHAR(255),
  syscall VARCHAR(255),
  traceable_by VARCHAR(255) NOT NULL,
  format VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (traceable_by) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"syscall_traceable"}'
