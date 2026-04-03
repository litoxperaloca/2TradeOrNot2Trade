# Terraform Variables for Azure

variable "subscription_id" {
  description = "Azure Subscription ID"
  type = string
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type = string
}

variable "location" {
  description = "Azure Region"
  type = string
}

variable "environment" {
  description = "Deployment Environment (e.g., dev, test, prod)"
  type = string
}

variable "instance_size" {
  description = "Size of the Azure instance"
  type = string
}

variable "security_settings" {
  description = "Security settings for the infrastructure"
  type = map(string)
}

variable "additional_config" {
  description = "Additional configuration parameters"
  type = map(string)
}
