CREATE TABLE t_agent_at_organization (
  id VARCHAR(255),
  agent VARCHAR(255),
  at_organization VARCHAR(255) NOT NULL,
  created_date DATE,
  owner VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"05_provo_lineage","is_complex":true,"template_id":"agent_at_organization"}'
