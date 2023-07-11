variable "datadog_api_key" {} # Provided by tfvars
variable "datadog_app_key" {} # Provided by tfvars

variable "user_email" {
  description = "Email address of the user to send notifications to"
  type = string
}