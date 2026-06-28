CREATE TABLE t_cgroup_skb_subclass (
  id VARCHAR(255),
  cgroup VARCHAR(255),
  attaches_to_cgroup VARCHAR(255) NOT NULL,
  license VARCHAR(255),
  version INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (attaches_to_cgroup) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"cgroup_skb_subclass"}'
