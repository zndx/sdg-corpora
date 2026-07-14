CREATE TABLE video_codecs (
  id INTEGER NOT NULL,
  codec_id VARCHAR(44),
  codec_name VARCHAR(32),
  compression_ratio DECIMAL,
  bitrate INTEGER,
  resolution VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);
