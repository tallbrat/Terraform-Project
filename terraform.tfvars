vpc_cidr = "10.0.0.0/16"
# Specify the desired vpc cidr value

availability_zones = ["us-west-1a", "us-west-1b"]
# Specify the availability zones you want to use

subnets_per_az = 2
# Specify the number of subnets per availability zone

number-of-public-subnet = 1
# Specify the number of public subnets per availability zone

number-of-private-subnet = 1
# Specify the number of priate subnets per availability zone


# Public Secruity Gateway
common_ingress_rules = [
  {
    from_port        = [80, 443]
    to_port          = [80, 443]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow HTTP and HTTPS traffic from anywhere"
  },
  {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow SSH traffic from anywhere"
  }
]

common_egress_rules = [
  {
    from_port        = [80, 443]
    to_port          = [80, 443]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow HTTP and HTTPS traffic from anywhere"
  },
  {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow SSH traffic from anywhere"
  }
]

#Private Secruity Gateway
ingress_rules_app = [
  {
    from_port        = [80, 443]
    to_port          = [80, 443]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow HTTP and HTTPS traffic from anywhere"
  },
  {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow SSH traffic from anywhere"
  }
]

egress_rules_app = [
  {
    from_port        = [80, 443]
    to_port          = [80, 443]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow HTTP and HTTPS traffic from anywhere"
  },
  {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow SSH traffic from anywhere"
  }
]

ingress_rules_db = [
  {
    from_port        = [80, 443]
    to_port          = [80, 443]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow HTTP and HTTPS traffic from anywhere"
  },
  {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow SSH traffic from anywhere"
  }
]

egress_rules_db = [
  {
    from_port        = [80, 443]
    to_port          = [80, 443]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow HTTP and HTTPS traffic from anywhere"
  },
  {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow SSH traffic from anywhere"
  }
]

#Instances
no-of-public-instance-in-each-tier = [ {web = 2} ]
#Specify the number of instance in each tier

no-of-private-instance-in-each-tier = [ {app = 3}, {db = 3} ]
#Specify the number of instance in each tier