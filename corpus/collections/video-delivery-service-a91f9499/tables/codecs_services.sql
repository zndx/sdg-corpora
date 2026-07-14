CREATE TABLE codecs_services (
  video_codec_id INTEGER NOT NULL,
  service_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (video_codec_id, service_id),
  FOREIGN KEY (video_codec_id) REFERENCES video_codecs (id),
  FOREIGN KEY (service_id) REFERENCES video_delivery_services (service_id)
);
