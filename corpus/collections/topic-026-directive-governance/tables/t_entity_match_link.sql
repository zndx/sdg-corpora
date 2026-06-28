CREATE TABLE t_entity_match_link (
  id VARCHAR(255),
  entity VARCHAR(255),
  matches_entity VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (matches_entity) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"entity_match_link"}'
