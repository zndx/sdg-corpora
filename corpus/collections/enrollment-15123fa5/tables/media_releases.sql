CREATE TABLE media_releases (
  id INTEGER NOT NULL,
  release_id VARCHAR(44),
  allows_video_recording BOOLEAN,
  allows_audio_recording BOOLEAN,
  allows_photography BOOLEAN,
  allows_promotional_use BOOLEAN,
  waives_right_to_sue BOOLEAN,
  hold_harmless_agreement BOOLEAN,
  signed_date TIMESTAMP,
  enrollment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (enrollment_id) REFERENCES enrollments (id)
);
