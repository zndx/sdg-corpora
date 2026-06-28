CREATE TABLE t_kernelhook_observes_event_class (
  id VARCHAR(255),
  kernelhook VARCHAR(255),
  observes_event VARCHAR(255) NOT NULL,
  location VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (observes_event) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"kernelhook_observes_event_class"}'
