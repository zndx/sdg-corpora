CREATE TABLE platforms_events (
  social_media_platform_id INTEGER NOT NULL,
  internal_communication_event_id INTEGER NOT NULL,
  PRIMARY KEY (social_media_platform_id, internal_communication_event_id),
  FOREIGN KEY (social_media_platform_id) REFERENCES social_media_platforms (id),
  FOREIGN KEY (internal_communication_event_id) REFERENCES internal_communication_events (internal_communication_event_id)
);
