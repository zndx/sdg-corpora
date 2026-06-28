CREATE TABLE t_ringbuf_map_subclass (
  id VARCHAR(255),
  ringbuf VARCHAR(255),
  ring_buffer_config VARCHAR(255) NOT NULL,
  checksum VARCHAR(255),
  identifier VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (ring_buffer_config) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"ringbuf_map_subclass"}'
