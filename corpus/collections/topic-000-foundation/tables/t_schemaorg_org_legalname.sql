CREATE TABLE t_schemaorg_org_legalname (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  legal_name VARCHAR(255) NOT NULL,
  name VARCHAR(255),
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (legal_name) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_org_legalname"}'
