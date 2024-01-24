###########################################################
# Resources Tags
###########################################################

variable "override_name_prefix" {
  default = ""
}

variable "environment" {
  description = "Abbreviated environment name"
  default     = "dev"
}

variable "project" {
  description = "Project abbreviation/prefix"
  default     = ""
}

# ---------------------------------------------------------
# Additional resource tags
# ---------------------------------------------------------

variable "additional_tags" {
  description = "Additional resource tags"
  type        = map(string)
  default     = {}
}

###########################################################
# LOCALS
###########################################################

locals {
  # Name prefix for label components
  name_prefix = lower(var.override_name_prefix != "" ? var.override_name_prefix : "${var.environment}-${var.project}")

  # Tagging policy
  tags = merge({
    Environment = var.environment
    Project     = var.project
  }, var.additional_tags)
}
