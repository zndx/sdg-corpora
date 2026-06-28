CREATE TABLE t_descriptive_only_about_artifact (
  id VARCHAR(255),
  descriptive VARCHAR(255),
  about VARCHAR(255),
  recorded_at TIMESTAMP,
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (about) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"descriptive_only_about_artifact"}'
