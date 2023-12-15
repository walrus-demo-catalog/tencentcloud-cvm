output "public_ip" {
  value = tencentcloud_instance.cvm.public_ip
}

output "private_ip" {
  value = data.tencentcloud_instances.cvm.instance_list.*.private_ip
}

output "os_name" {
  value = data.tencentcloud_images.images_ds.images.0.os_name
}

output "cpu" {
  value = var.cpu_core_count
}

output "memory" {
  value = var.memory_size
}

output "key_id" {
  value = var.key_id
}
