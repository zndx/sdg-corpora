CREATE TABLE modules_evidences (
  video_analytics_module_id INTEGER NOT NULL,
  forensic_evidence_id INTEGER NOT NULL,
  PRIMARY KEY (video_analytics_module_id, forensic_evidence_id),
  FOREIGN KEY (video_analytics_module_id) REFERENCES video_analytics_modules (id),
  FOREIGN KEY (forensic_evidence_id) REFERENCES forensic_evidences (id)
);
