# k8s-config-map-from-gcp-storage
Download file from GCP storage bucket and store as a config map

## Usage


```
module "k8s-configmap" {
  source = "./"

  bucket = "bucket-name"
  object_key = "object_key.env"
  name = "configmap-name"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| google | >= 3.38.0 |
| random | >= 2.2 |

## Providers

| Name | Version |
|------|---------|
| random | >= 2.2 |
| google | >= 3.38.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket | Name of the bucket | `string` | `diagvn-configs` | no |
| object_key | Storage object key | `string` | `null` | yes |
| name | Config map name and data key | `string` | `null` | yes |
| credentials | Service account json credentials | `string` | `null` | yes |
| namespace | Config map namespace | `string` | `default` | no |

## Outputs

| Name | Description |
|------|-------------|
| config_map_name | Config map name |
