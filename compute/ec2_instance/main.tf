

resource "aws_instance" "public_instances" {
  for_each        = {for obj in var.no-of-public-instance-in-each-tier : obj.tier => obj.count}
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = {
    for index, subenet_id in values(module.subnet["public_subnets_for_${var.availability_zones [count.index]}"]) : index => subnet_id
  }
  security_groups = module.security_groups.public_security_group_ids[count.index]
  tags = {
    Name = "public-instance-${each.key}-${count.index + 1}"
    tier = "${each.key}"
  }
}

resource "aws_instance" "private_instances" {
  for_each        = {for obj in var.no-of-private-instance-in-each-tier : obj.tier => obj.count}
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = {
    for index, subenet_id in values(module.subnet["private_subnets_for_${var.availability_zones [count.index]}"]) : index => subnet_id
  }
  security_groups = {
    for index, sg_id in values (module.security_groups["private_sg_ids_${element(keys(var.no-of-public-instance-in-each-tier), count.index)}"]) : index => sg_id}
  tags = {
    Name = "public-instance-${each.key}-${count.index + 1}"
    tier = "${each.key}"
  }
}

/*
resource "aws_instance" "private_instances" {
  count         = length(var.private_subnet_ids)
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_ids[count.index]
  
  tags = {
    Name = "private-instance-${count.index + 1}"
  }
}
*/
