CREATE TABLE t_instrument_with_function (
  id VARCHAR(255),
  instrument VARCHAR(255),
  realizes_function VARCHAR(255) NOT NULL,
  checksum VARCHAR(255),
  size_bytes BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (realizes_function) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"instrument_with_function"}'
