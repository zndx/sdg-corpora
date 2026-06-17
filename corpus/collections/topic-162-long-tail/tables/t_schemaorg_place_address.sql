CREATE TABLE t_schemaorg_place_address (
  id VARCHAR(255),
  subject VARCHAR(255),
  postal_address VARCHAR(255) NOT NULL,
  created_date DATE,
  identifier VARCHAR(255),
  version INTEGER,
  location VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (postal_address) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_place_address"}'
