CREATE TABLE t_client_data_record (
  id VARCHAR(255),
  client_data_record VARCHAR(255),
  contains VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":true,"template_id":"client_data_record"}'
