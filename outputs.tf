output "config_map_name" {
  value = kubernetes_config_map.config-map.metadata[0].name
  description = "Config map metadata name"
}
