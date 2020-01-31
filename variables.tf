######## For KMS key #######
variable "create_kms" {
  type        = bool
  description = "Do you want to create KMS key"
  default     = true
}

variable "kms_description" {
  type        = string
  description = "The description of the key as viewed in AWS console."
  default     = null
}

variable "kms_is_enabled" {
  type        = bool
  description = "Specifies whether the key is enabled. Defaults to true."
  default     = true
}

variable "kms_enable_key_rotation" {
  type        = bool
  description = "Specifies whether key rotation is enabled. Defaults to false."
  default     = false
}
variable "kms_deletion_window_in_days" {
  type        = number
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days"
  default     = 30
}

variable "kms_policy" {
  type        = string
  description = "A valid policy JSON document. For more information about building AWS IAM policy documents with Terraform"
  default     = null
}
variable "kms_customer_master_key_spec" {
  type        = string
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1. Defaults to SYMMETRIC_DEFAULT"
  default     = "SYMMETRIC_DEFAULT"
}

variable "kms_key_usage" {
  type        = string
  description = "Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT or SIGN_VERIFY. Defaults to ENCRYPT_DECRYPT"
  default     = "ENCRYPT_DECRYPT"
}

variable "tags" {
  type        = map(string)
  description = "Tags to attach"
  default     = {}
}

############ MKS Cluster ##########
variable "cluster_name" {
  type        = string
  description = "Name of the MSK cluster"
  default     = "example"
}
variable "kafka_version" {
  type        = string
  description = "Specify the desired Kafka software version"
  default     = "2.1.0"
}
variable "number_of_broker_nodes" {
  type        = number
  description = "The desired total number of broker nodes in the kafka cluster. It must be a multiple of the number of specified client subnets."
  default     = 3
}

variable "client_subnets" {
  type        = list(string)
  description = "A list of subnets to connect to in client VPC"
  default     = []
}
variable "ebs_volume_size" {
  type        = number
  description = "The size in GiB of the EBS volume for the data drive on each broker node"
  default     = 100
}
variable "instance_type" {
  type        = string
  description = "Specify the instance type to use for the kafka brokers. e.g. kafka.m5.large."
  default     = "kafka.m5.large"
}
variable "security_groups" {
  type        = list(string)
  description = "A list of the security groups to associate with the elastic network interfaces to control who can communicate with the cluster."
  default     = []
}

variable "az_distribution" {
  type        = string
  description = "The distribution of broker nodes across availability zones Currently the only valid value is DEFAULT"
  default     = "DEFAULT"
}

