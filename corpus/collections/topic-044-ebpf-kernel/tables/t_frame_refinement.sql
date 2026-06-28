CREATE TABLE t_frame_refinement (
  id VARCHAR(255),
  frame VARCHAR(255),
  refines_frame VARCHAR(255) NOT NULL,
  method VARCHAR(255),
  recorded_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (refines_frame) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"frame_refinement"}'
