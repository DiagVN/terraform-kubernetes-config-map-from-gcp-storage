module "example_module" {
  source = "../."

  object_key = "folder/.env"
  credentials = file("credentials.json")
  name = "dot-env-config-map"
}
