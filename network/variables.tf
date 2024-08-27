variable "pj" {
  type        = string
  description = "PJ名"
}

variable "name" {
  type        = string
  description = "自身の名前"
}

variable "vpc-cidr" {
  type        = string
  description = "VPCのCIDR"
}

variable "subnet-cidr" {
  type        = string
  description = "サブネットのCIDRのリスト"
}
