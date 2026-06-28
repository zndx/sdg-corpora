CREATE TABLE t_kernelhook_with_attached_program (
  id VARCHAR(255),
  kernelhook VARCHAR(255),
  attached_program VARCHAR(255) NOT NULL,
  size_bytes BIGINT,
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (attached_program) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"kernelhook_with_attached_program"}'
