CREATE TABLE t_schemaorg_org_country (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  country VARCHAR(255) NOT NULL,
  license VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (country) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_org_country"}'
