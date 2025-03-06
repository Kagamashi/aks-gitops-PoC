variable tags {
  type = map(any)
  description = "A mapping of tags assigned to resources"
  default = {
    environment = "${var.environment}"
    project     = "aks-gitops-PoC"
  }
}

variable "location" {
  description = "The location/region where the resource group will be created."
  default     = "westeurope"
}

variable "environment" {
  description = "The environment to deploy the resources to. Possible values are: d, np, p"
  default     = "d"
}
