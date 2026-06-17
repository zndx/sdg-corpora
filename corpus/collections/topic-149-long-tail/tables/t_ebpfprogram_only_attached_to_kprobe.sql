CREATE TABLE t_ebpfprogram_only_attached_to_kprobe (
  id VARCHAR(255),
  subject VARCHAR(255),
  attaches_to_hook VARCHAR(255),
  created_date DATE,
  identifier VARCHAR(255),
  version INTEGER,
  location VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (attaches_to_hook) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfprogram_only_attached_to_kprobe"}'
