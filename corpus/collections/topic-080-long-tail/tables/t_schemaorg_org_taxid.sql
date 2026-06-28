CREATE TABLE t_schemaorg_org_taxid (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  tax_i_d VARCHAR(255) NOT NULL,
  owner VARCHAR(255),
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (tax_i_d) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_org_taxid"}'
