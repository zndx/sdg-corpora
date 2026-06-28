CREATE TABLE t_professional_expertise_domain (
  id VARCHAR(255),
  professional_expertise_domain VARCHAR(255),
  covers_sector VARCHAR(255) NOT NULL,
  provides_service_type VARCHAR(255) NOT NULL,
  unit VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"08_derived","is_complex":true,"template_id":"professional_expertise_domain"}'
