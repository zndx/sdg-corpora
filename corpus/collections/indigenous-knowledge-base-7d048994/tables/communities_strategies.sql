CREATE TABLE communities_strategies (
  community_id INTEGER NOT NULL,
  strategy_id INTEGER NOT NULL,
  PRIMARY KEY (community_id, strategy_id),
  FOREIGN KEY (community_id) REFERENCES communities (id),
  FOREIGN KEY (strategy_id) REFERENCES risk_reduction_strategies (strategy_id)
);
