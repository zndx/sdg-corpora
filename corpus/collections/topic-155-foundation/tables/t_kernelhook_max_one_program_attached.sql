CREATE TABLE t_kernelhook_max_one_program_attached (
  id VARCHAR(255),
  kernelhook VARCHAR(255),
  attached_program VARCHAR(255),
  checksum VARCHAR(255),
  size_bytes BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (attached_program) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"kernelhook_max_one_program_attached"}'
