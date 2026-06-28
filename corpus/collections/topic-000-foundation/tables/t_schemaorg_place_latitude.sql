CREATE TABLE t_schemaorg_place_latitude (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  latitude VARCHAR(255) NOT NULL,
  created_date DATE,
  owner VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (latitude) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_place_latitude"}'
