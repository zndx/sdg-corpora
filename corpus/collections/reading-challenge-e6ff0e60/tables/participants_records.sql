CREATE TABLE participants_records (
  participant_id VARCHAR(44) NOT NULL,
  reading_record_id INTEGER NOT NULL,
  PRIMARY KEY (participant_id, reading_record_id),
  FOREIGN KEY (participant_id) REFERENCES reading_participants (participant_id),
  FOREIGN KEY (reading_record_id) REFERENCES reading_records (id)
);
