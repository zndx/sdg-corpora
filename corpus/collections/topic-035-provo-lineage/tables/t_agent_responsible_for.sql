CREATE TABLE t_agent_responsible_for (
  id VARCHAR(255),
  agent VARCHAR(255),
  responsible_for VARCHAR(255) NOT NULL,
  checksum VARCHAR(255),
  uri VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"05_provo_lineage","is_complex":true,"template_id":"agent_responsible_for"}'
