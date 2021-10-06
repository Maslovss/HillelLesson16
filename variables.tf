
variable "key_name" {
  default = "ec2Key"
}

variable "region" {
  default = "eu-central-1"
}


variable "networking" {
  default =  {
    cidr_block = "10.10.0.0/24"
    subnet_address = "10.10.0.0/24"
    pods_cidr_block = "10.244.0.0/16"
    availability_zone_id = "euc1-az1"
  }
}


variable "kube_master" {
  default = {
    ami                    = "ami-05f7491af5eef733a"
    instance_type          = "t2.medium"    
  }
}


variable "kube_workers" {
  default = {
    worker1 = {
      ami                    = "ami-05f7491af5eef733a"
      instance_type          = "t2.medium"
      ebs_drive_size         = 20
    }

    worker2 = {
      ami                    = "ami-05f7491af5eef733a"
      instance_type          = "t2.medium"  
      ebs_drive_size         = 20
    }
  }
}

variable "tags" {
  default = {
    Environment = "development"
  }
}

