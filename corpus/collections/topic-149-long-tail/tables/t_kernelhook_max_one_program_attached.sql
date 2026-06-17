CREATE TABLE t_kernelhook_max_one_program_attached (
  id VARCHAR(255),
  subject VARCHAR(255),
  attached_program VARCHAR(255),
  created_date DATE,
  identifier VARCHAR(255),
  version INTEGER,
  location VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (attached_program) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"kernelhook_max_one_program_attached"}'
