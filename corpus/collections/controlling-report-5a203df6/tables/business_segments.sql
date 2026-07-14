CREATE TABLE business_segments (
  id INTEGER NOT NULL,
  segment_code VARCHAR(32),
  segment_name VARCHAR(32),
  segment_type VARCHAR(32),
  is_consolidated BOOLEAN,
  parent_organization_id VARCHAR(34),
  controlling_report_id INTEGER,
  business_segment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (controlling_report_id) REFERENCES controlling_reports (id),
  FOREIGN KEY (business_segment_id) REFERENCES business_segments (id)
);
