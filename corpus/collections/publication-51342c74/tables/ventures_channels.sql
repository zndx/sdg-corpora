CREATE TABLE ventures_channels (
  joint_venture_id INTEGER NOT NULL,
  radio_channel_id INTEGER NOT NULL,
  PRIMARY KEY (joint_venture_id, radio_channel_id),
  FOREIGN KEY (joint_venture_id) REFERENCES joint_ventures (id),
  FOREIGN KEY (radio_channel_id) REFERENCES radio_channels (id)
);
