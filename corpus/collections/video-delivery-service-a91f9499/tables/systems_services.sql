CREATE TABLE systems_services (
  d_r_m_system_drm_id VARCHAR(44) NOT NULL,
  service_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (d_r_m_system_drm_id, service_id),
  FOREIGN KEY (d_r_m_system_drm_id) REFERENCES d_r_m_systems (drm_id),
  FOREIGN KEY (service_id) REFERENCES video_delivery_services (service_id)
);
