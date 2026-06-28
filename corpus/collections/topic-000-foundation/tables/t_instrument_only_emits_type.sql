CREATE TABLE t_instrument_only_emits_type (
  id VARCHAR(255),
  instrument VARCHAR(255),
  emits_signal VARCHAR(255),
  created_date DATE,
  size_bytes BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (emits_signal) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"instrument_only_emits_type"}'
