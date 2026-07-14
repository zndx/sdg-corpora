CREATE TABLE meetings_resolutions (
  meeting_id VARCHAR(44) NOT NULL,
  fee_resolution_id INTEGER NOT NULL,
  PRIMARY KEY (meeting_id, fee_resolution_id),
  FOREIGN KEY (meeting_id) REFERENCES annual_general_meetings (meeting_id),
  FOREIGN KEY (fee_resolution_id) REFERENCES fee_resolutions (id)
);
