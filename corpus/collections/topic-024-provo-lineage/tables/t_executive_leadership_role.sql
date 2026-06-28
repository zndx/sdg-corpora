CREATE TABLE t_executive_leadership_role (
  id VARCHAR(255),
  executive_leadership_role VARCHAR(255),
  reports_to VARCHAR(255),
  member_of VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"08_derived","is_complex":true,"template_id":"executive_leadership_role"}'
