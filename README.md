## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | 1.81.58 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | 1.81.58 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tencentcloud_instance.cvm](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.58/docs/resources/instance) | resource |
| [tencentcloud_security_group.app_sg](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.58/docs/resources/security_group) | resource |
| [tencentcloud_security_group_lite_rule.app_sg_rules](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.58/docs/resources/security_group_lite_rule) | resource |
| [tencentcloud_subnet.app_subnet](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.58/docs/resources/subnet) | resource |
| [tencentcloud_vpc.app_vpc](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.58/docs/resources/vpc) | resource |
| [tencentcloud_availability_zones_by_product.app_azs](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.58/docs/data-sources/availability_zones_by_product) | data source |
| [tencentcloud_images.images_ds](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.58/docs/data-sources/images) | data source |
| [tencentcloud_instance_types.types_ds](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.58/docs/data-sources/instance_types) | data source |
| [tencentcloud_instances.cvm](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.58/docs/data-sources/instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_core_count"></a> [cpu\_core\_count](#input\_cpu\_core\_count) | The CPU core of the CVM instance, value range: [1, 384] | `number` | `2` | no |
| <a name="input_init_script"></a> [init\_script](#input\_init\_script) | User-defined init script to customize the startup behaviors of the CVM instance and to pass data into the CVM instance, aka user\_data\_raw | `string` | `"#!/bin/bash\napt update\n"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The instance name and hostname of the CVM instance | `string` | n/a | yes |
| <a name="input_internet_charge_type"></a> [internet\_charge\_type](#input\_internet\_charge\_type) | The billing method of the public network bandwidth, valid values are BANDWIDTH\_PREPAID, TRAFFIC\_POSTPAID\_BY\_HOUR, BANDWIDTH\_POSTPAID\_BY\_HOUR, BANDWIDTH\_PACKAGE | `string` | `"TRAFFIC_POSTPAID_BY_HOUR"` | no |
| <a name="input_internet_max_bandwidth_out"></a> [internet\_max\_bandwidth\_out](#input\_internet\_max\_bandwidth\_out) | The maximum outbound bandwidth of the public network, value range: [1, 100] | `number` | `10` | no |
| <a name="input_key_id"></a> [key\_id](#input\_key\_id) | ID of the ssh private key, must already exist | `list` | <pre>[<br>  "skey-nvs2lydx"<br>]</pre> | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | The memory size of the CVM instance, value range: [1, 3072] | `number` | `4` | no |
| <a name="input_os_name"></a> [os\_name](#input\_os\_name) | The image tag of the image used to launch the CVM instance, refer to https://cloud.tencent.com/document/product/213/93093 | `string` | `"Ubuntu Server 20.04"` | no |
| <a name="input_system_disk_size"></a> [system\_disk\_size](#input\_system\_disk\_size) | The size of the system disk, value range: [20, 1024] | `number` | `40` | no |
| <a name="input_system_disk_type"></a> [system\_disk\_type](#input\_system\_disk\_type) | The type of the system disk, valid values are LOCAL\_BASIC, LOCAL\_SSD, CLOUD\_BASIC, CLOUD\_SSD, CLOUD\_PREMIUM, CLOUD\_BSSD, CLOUD\_HSSD, CLOUD\_TSSD, and related to the instance type | `string` | `"CLOUD_PREMIUM"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cpu"></a> [cpu](#output\_cpu) | n/a |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | n/a |
| <a name="output_memory"></a> [memory](#output\_memory) | n/a |
| <a name="output_os_name"></a> [os\_name](#output\_os\_name) | n/a |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | n/a |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
