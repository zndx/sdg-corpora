CREATE TABLE t_ebpfprogram_attaches_kernelhook_xref (
  id VARCHAR(255),
  subject VARCHAR(255),
  created_date DATE,
  identifier VARCHAR(255),
  version INTEGER,
  location VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfprogram_attaches_kernelhook_xref"}'
