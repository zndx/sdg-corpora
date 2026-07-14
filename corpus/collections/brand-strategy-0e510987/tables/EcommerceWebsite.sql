CREATE TABLE EcommerceWebsite (
  id INTEGER NOT NULL,
  ecommerceId VARCHAR(44),
  storeName VARCHAR(32),
  conversionRate DECIMAL,
  paymentGateway VARCHAR(32),
  inventorySystem VARCHAR(32),
  socialIntegration BOOLEAN,
  lastAuditDate DATE,
  PRIMARY KEY (id)
);
