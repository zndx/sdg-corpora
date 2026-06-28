CREATE TABLE t_strategic_commitment (
  id VARCHAR(255),
  strategic_commitment VARCHAR(255),
  pursues_objective VARCHAR(255) NOT NULL,
  supports_stakeholder VARCHAR(255) NOT NULL,
  effective_date DATE,
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"08_derived","is_complex":true,"template_id":"strategic_commitment"}'
