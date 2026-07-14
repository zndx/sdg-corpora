CREATE TABLE codecs_infrastructures (
  video_codec_id INTEGER NOT NULL,
  network_infrastructure_network_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (video_codec_id, network_infrastructure_network_id),
  FOREIGN KEY (video_codec_id) REFERENCES video_codecs (id),
  FOREIGN KEY (network_infrastructure_network_id) REFERENCES network_infrastructures (network_id)
);
