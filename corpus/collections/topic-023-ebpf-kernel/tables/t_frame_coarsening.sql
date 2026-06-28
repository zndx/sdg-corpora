CREATE TABLE t_frame_coarsening (
  id VARCHAR(255),
  frame VARCHAR(255),
  coarsens_frame VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  unit VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (coarsens_frame) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"frame_coarsening"}'
