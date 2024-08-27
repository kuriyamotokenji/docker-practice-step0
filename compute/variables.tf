variable "pj" {
  type        = string
  description = "PJ名"
}

variable "name" {
  type        = string
  description = "自身の名前"
}

variable "app" {
  type        = string
  description = "アプリケーション名"
}

variable "type" {
  type        = string
  description = "EC2のインスタンスタイプ"
}

variable "vpc-id" {
  type        = string
  description = "EC2をデプロイするVPCのID"
}

variable "subnet-id" {
  type        = string
  description = "EC2をデプロイするサブネットのID"
}
