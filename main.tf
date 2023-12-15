terraform {
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = "1.81.58"
    }
  }
}

resource "tencentcloud_instance" "cvm" {
  availability_zone = data.tencentcloud_availability_zones_by_product.app_azs.zones.0.name
  instance_name     = var.instance_name
  instance_type     = data.tencentcloud_instance_types.types_ds.instance_types.0.instance_type
  image_id          = data.tencentcloud_images.images_ds.images.0.image_id
  system_disk_type  = var.system_disk_type
  system_disk_size  = var.system_disk_size

  allocate_public_ip         = true
  internet_charge_type       = var.internet_charge_type
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  vpc_id                     = tencentcloud_vpc.app_vpc.id
  subnet_id                  = tencentcloud_subnet.app_subnet.id
  orderly_security_groups = [
    tencentcloud_security_group.app_sg.id
  ]

  hostname = var.instance_name
  key_ids  = var.key_id

  user_data_raw = var.init_script
}

data "tencentcloud_instances" "cvm" {
  instance_id = tencentcloud_instance.cvm.id
}

data "tencentcloud_availability_zones_by_product" "app_azs" {
  product = "cvm"
}

resource "tencentcloud_vpc" "app_vpc" {
  name       = "app_vpc"
  cidr_block = "10.0.0.0/16"
}

resource "tencentcloud_subnet" "app_subnet" {
  name              = "app_subnet"
  vpc_id            = tencentcloud_vpc.app_vpc.id
  availability_zone = data.tencentcloud_availability_zones_by_product.app_azs.zones.0.name
  cidr_block        = "10.0.1.0/24"
}

resource "tencentcloud_security_group" "app_sg" {
  name = "app_sg"
}

resource "tencentcloud_security_group_lite_rule" "app_sg_rules" {
  security_group_id = tencentcloud_security_group.app_sg.id

  ingress = [
    "ACCEPT#0.0.0.0/0#22,80,443,8080#TCP",
    "ACCEPT#0.0.0.0/0#30000-32767#TCP",
    "ACCEPT#0.0.0.0/0#ALL#ICMP"
  ]
}

data "tencentcloud_instance_types" "types_ds" {
  cpu_core_count   = var.cpu_core_count
  memory_size      = var.memory_size
  exclude_sold_out = true
  filter {
    name   = "instance-charge-type"
    values = ["POSTPAID_BY_HOUR"]
  }
  filter {
    name   = "zone"
    values = [data.tencentcloud_availability_zones_by_product.app_azs.zones.0.name]
  }
}

data "tencentcloud_images" "images_ds" {
  instance_type = data.tencentcloud_instance_types.types_ds.instance_types.0.instance_type
  image_type    = ["PUBLIC_IMAGE"]
  os_name       = var.os_name
}
