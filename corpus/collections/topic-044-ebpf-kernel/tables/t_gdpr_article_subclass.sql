CREATE TABLE t_gdpr_article_subclass (
  id VARCHAR(255),
  gdpr VARCHAR(255),
  gdpr_article VARCHAR(255) NOT NULL,
  mandatory BOOLEAN,
  review_cycle_days INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (gdpr_article) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"gdpr_article_subclass"}'
