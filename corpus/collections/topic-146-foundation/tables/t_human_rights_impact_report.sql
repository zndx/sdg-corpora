CREATE TABLE t_human_rights_impact_report (
  id VARCHAR(255),
  human_rights_impact_report VARCHAR(255),
  reports_on VARCHAR(255) NOT NULL,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":false,"template_id":"human_rights_impact_report"}'
