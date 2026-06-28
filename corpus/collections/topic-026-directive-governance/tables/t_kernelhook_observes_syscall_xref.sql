CREATE TABLE t_kernelhook_observes_syscall_xref (
  id VARCHAR(255),
  kernelhook VARCHAR(255),
  created_date DATE,
  owner VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"kernelhook_observes_syscall_xref"}'
