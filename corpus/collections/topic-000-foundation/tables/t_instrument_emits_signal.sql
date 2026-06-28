CREATE TABLE t_instrument_emits_signal (
  id VARCHAR(255),
  instrument VARCHAR(255),
  emits_signal VARCHAR(255) NOT NULL,
  size_bytes BIGINT,
  uri VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (emits_signal) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"instrument_emits_signal"}'
