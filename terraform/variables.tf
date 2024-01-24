###########################################################
# VARIABLE
###########################################################

# ---------------------------------------------------------
# REQUIRED PARAMETERS
# ---------------------------------------------------------

# ---------------------------------------------------------
# OPTIONAL PARAMETERS
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

variable "force_destroy" {
  type        = bool
  description = "Allow bucket to be destroyed on delete, regardless of if it contains data"
}
