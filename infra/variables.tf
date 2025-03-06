variable "location" {
  description = "The location/region where the resource group will be created."
  default     = "westeurope"
}

variable "environment" {
  description = "The environment to deploy the resources to. Possible values are: d, np, p"
  default     = "d"
}
