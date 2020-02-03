resource "aws_kms_key" "kms" {
  count                    = var.create_kms ? 1 : 0
  description              = var.kms_description
  key_usage                = var.kms_key_usage
  customer_master_key_spec = var.kms_customer_master_key_spec
  policy                   = var.kms_policy
  deletion_window_in_days  = var.kms_deletion_window_in_days
  is_enabled               = var.kms_is_enabled
  enable_key_rotation      = var.kms_enable_key_rotation
  tags                     = var.tags
}

resource "aws_msk_cluster" "this" {
  count                  = var.create_mks ? 1 : 0
  cluster_name           = var.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes == length(var.client_subnets) ? var.number_of_broker_nodes : length(var.client_subnets)

  broker_node_group_info {
    instance_type   = var.instance_type
    ebs_volume_size = var.ebs_volume_size
    client_subnets = var.client_subnets
    security_groups = var.security_groups
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = "${aws_kms_key.kms.arn}"
  }

  tags = var.tags
}
