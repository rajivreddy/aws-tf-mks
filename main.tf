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


resource "aws_msk_cluster" "example" {
  count                  = var.create_mks ? 1 : 0
  cluster_name           = "example"
  kafka_version          = "2.1.0"
  number_of_broker_nodes = 3

  broker_node_group_info {
    instance_type   = "kafka.m5.large"
    ebs_volume_size = 1000
    client_subnets = [
      "${aws_subnet.subnet_az1.id}",
      "${aws_subnet.subnet_az2.id}",
      "${aws_subnet.subnet_az3.id}",
    ]
    security_groups = ["${aws_security_group.sg.id}"]
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = "${aws_kms_key.kms.arn}"
  }

  tags = {
    foo = "bar"
  }
}
