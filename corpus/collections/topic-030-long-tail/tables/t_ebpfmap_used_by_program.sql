CREATE TABLE t_ebpfmap_used_by_program (
  id VARCHAR(255),
  ebpfmap VARCHAR(255),
  used_by_program VARCHAR(255) NOT NULL,
  created_date DATE,
  version INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (used_by_program) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfmap_used_by_program"}'
