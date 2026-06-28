CREATE TABLE t_ebpfprogram_attaches_kernelhook_xref (
  id VARCHAR(255),
  ebpfprogram VARCHAR(255),
  mime_type VARCHAR(255),
  location VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfprogram_attaches_kernelhook_xref"}'
