CREATE TABLE t_clinical_quality_research_role (
  id VARCHAR(255),
  clinical_quality_research_role VARCHAR(255),
  holds_role_in VARCHAR(255),
  applies_to VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023","cco:OrganizationalRole"],"family":"08_derived","is_complex":true,"template_id":"clinical_quality_research_role"}'
