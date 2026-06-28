CREATE TABLE t_knowledge_base_integration (
  id VARCHAR(255),
  knowledge_base_integration VARCHAR(255),
  incorporates_indigenous_knowledge VARCHAR(255) NOT NULL,
  incorporates_scientific_knowledge VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":true,"template_id":"knowledge_base_integration"}'
