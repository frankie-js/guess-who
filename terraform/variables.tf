###########################################################
# VARIABLE
###########################################################

# ---------------------------------------------------------
# REQUIRED PARAMETERS
# ---------------------------------------------------------

variable "profile" {
  type        = string
  description = "AWS named profile"
  default     = "default"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

# ---------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------
