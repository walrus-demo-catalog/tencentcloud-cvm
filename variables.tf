variable "instance_name" {
  type        = string
  description = "The instance name and hostname of the CVM instance"
}

variable "cpu_core_count" {
  description = "The CPU core of the CVM instance, value range: [1, 384]"
  default     = 2
}

variable "memory_size" {
  description = "The memory size of the CVM instance, value range: [1, 3072]"
  default     = 4
}

variable "os_name" {
  description = "The image tag of the image used to launch the CVM instance, refer to https://cloud.tencent.com/document/product/213/93093"
  default     = "Ubuntu Server 20.04"
}

variable "system_disk_type" {
  description = "The type of the system disk, valid values are LOCAL_BASIC, LOCAL_SSD, CLOUD_BASIC, CLOUD_SSD, CLOUD_PREMIUM, CLOUD_BSSD, CLOUD_HSSD, CLOUD_TSSD, and related to the instance type"
  default     = "CLOUD_PREMIUM"
}

variable "system_disk_size" {
  description = "The size of the system disk, value range: [20, 1024]"
  default     = 40
}

variable "internet_charge_type" {
  description = "The billing method of the public network bandwidth, valid values are BANDWIDTH_PREPAID, TRAFFIC_POSTPAID_BY_HOUR, BANDWIDTH_POSTPAID_BY_HOUR, BANDWIDTH_PACKAGE"
  default     = "TRAFFIC_POSTPAID_BY_HOUR"
}

variable "internet_max_bandwidth_out" {
  description = "The maximum outbound bandwidth of the public network, value range: [1, 100]"
  default     = 10
}

variable "init_script" {
  type        = string
  description = "User-defined init script to customize the startup behaviors of the CVM instance and to pass data into the CVM instance, aka user_data_raw"
  default     = <<-EOT
              #!/bin/bash
              apt update
              EOT
}

variable "key_id" {
  description = "ID of the ssh private key, must already exist"
  default     = ["skey-nvs2lydx"]
}
