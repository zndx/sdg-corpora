CREATE TABLE t_schema_migration_subclass (
  id VARCHAR(255),
  schema VARCHAR(255),
  migrates_schema_to VARCHAR(255) NOT NULL,
  end_time TIMESTAMP,
  retry_count INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (migrates_schema_to) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"schema_migration_subclass"}'
