CREATE TABLE t_agent_with_role (
  id VARCHAR(255),
  agent VARCHAR(255),
  agent_role VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  size_bytes BIGINT,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"05_provo_lineage","is_complex":true,"template_id":"agent_with_role"}'
