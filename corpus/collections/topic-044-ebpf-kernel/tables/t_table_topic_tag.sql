CREATE TABLE t_table_topic_tag (
  id VARCHAR(255),
  table VARCHAR(255),
  table_topic VARCHAR(255) NOT NULL,
  method VARCHAR(255),
  encoding VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (table_topic) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"table_topic_tag"}'
