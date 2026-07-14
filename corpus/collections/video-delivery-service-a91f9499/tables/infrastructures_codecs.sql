CREATE TABLE infrastructures_codecs (
  network_infrastructure_network_id VARCHAR(44) NOT NULL,
  video_codec_id INTEGER NOT NULL,
  PRIMARY KEY (network_infrastructure_network_id, video_codec_id),
  FOREIGN KEY (network_infrastructure_network_id) REFERENCES network_infrastructures (network_id),
  FOREIGN KEY (video_codec_id) REFERENCES video_codecs (id)
);
