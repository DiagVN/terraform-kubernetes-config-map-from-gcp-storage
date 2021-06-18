data "google_storage_object_signed_url" "get_url" {
  bucket       = var.bucket
  path         = var.object_key
  duration     = "3h"
  credentials = var.credentials
}

resource "random_uuid" "uuid" {}

data "external" "http" {
  program = [
    "/bin/bash",
    "${path.module}/download.sh",
    data.google_storage_object_signed_url.get_url.signed_url,
    "${random_uuid.uuid.result}.txt",
  ]

}

resource "kubernetes_config_map" "config-map" {
  metadata {
    name = var.name
    namespace = var.namespace
  }
  data = {
    "${var.name}" = file("${random_uuid.uuid.result}.txt")
  }
  depends_on = [
    data.external.http,
  ]
}
