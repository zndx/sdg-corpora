CREATE TABLE t_agent_identified_by_uri (
  id VARCHAR(255),
  agent VARCHAR(255),
  identified_by_u_r_i VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  owner VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"05_provo_lineage","is_complex":true,"template_id":"agent_identified_by_uri"}'
