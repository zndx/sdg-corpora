CREATE TABLE circles_segments (
  tangent_circle_id INTEGER NOT NULL,
  segment_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (tangent_circle_id, segment_id),
  FOREIGN KEY (tangent_circle_id) REFERENCES tangent_circles (id),
  FOREIGN KEY (segment_id) REFERENCES straight_line_segments (segment_id)
);
