CREATE TABLE t_ebpfprogram_loaded_in_kernel (
  id VARCHAR(255),
  ebpfprogram VARCHAR(255),
  loaded_in VARCHAR(255) NOT NULL,
  size_bytes BIGINT,
  owner VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (loaded_in) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfprogram_loaded_in_kernel"}'
