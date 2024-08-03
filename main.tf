# ---------------------------
# Terraform
# ---------------------------
terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

# ---------------------------
# Provider
# ---------------------------
provider "aws" {
  profile = "terraform"
  region  = "ap-southeast-1"
}

# ---------------------------
# Variables
# ---------------------------
variable "project" {
  type = string
}

variable "user" {
  type = string
}

variable "myip" {
  type = string
}

variable "region" {
  type = string
}

variable "az_1a" {
  type = string
}

variable "az_1c" {
  type = string
}

variable "keypair" {
  type = string
}