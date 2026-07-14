CREATE TABLE services_codecs (
  service_id VARCHAR(44) NOT NULL,
  video_codec_id INTEGER NOT NULL,
  PRIMARY KEY (service_id, video_codec_id),
  FOREIGN KEY (service_id) REFERENCES video_delivery_services (service_id),
  FOREIGN KEY (video_codec_id) REFERENCES video_codecs (id)
);
