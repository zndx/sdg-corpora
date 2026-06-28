CREATE TABLE t_dbpedia_label_alignment (
  id VARCHAR(255),
  dbpedia VARCHAR(255),
  aligned_to_d_bpedia_label VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  dimension_kind VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (aligned_to_d_bpedia_label) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"dbpedia_label_alignment"}'
