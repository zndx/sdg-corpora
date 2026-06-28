CREATE TABLE t_schemaorg_label_alignment (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  aligned_to_schema_org_label VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (aligned_to_schema_org_label) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_label_alignment"}'
