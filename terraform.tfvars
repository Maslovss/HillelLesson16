
region                 = "eu-central-1"
key_name               = "k8s_ssh_key" 


networking = {
  cidr_block           = "10.10.0.0/24"
  subnet_address       = "10.10.0.0/24"
  pods_cidr_block      = "10.244.0.0/16"
  availability_zone_id = "euc1-az2"
}


kube_master = {
  ami                  = "ami-05f7491af5eef733a"
  instance_type        = "t2.medium"    
}

kube_workers = {
  worker1 = {
    ami                 = "ami-05f7491af5eef733a"
    instance_type       = "t2.medium"
    ebs_drive_size      = 20
  }


  worker2 = {
    ami                 = "ami-05f7491af5eef733a"
    instance_type       = "t2.medium"  
    ebs_drive_size       = 40    
  }

  worker3 = {
    ami                 = "ami-05f7491af5eef733a"
    instance_type       = "t2.medium"  
    ebs_drive_size       = 200    
  }

  worker4 = {
    ami                 = "ami-05f7491af5eef733a"
    instance_type       = "t2.medium"  
    ebs_drive_size       = 40    
  }  

  worker5 = {
    ami                 = "ami-05f7491af5eef733a"
    instance_type       = "t2.medium"  
    ebs_drive_size       = 40    
  }

}


tags = {
    Environment = "development"
    Accounting = "Hillel"
    Lesson = "Lesson17"
    Owner = "maslovss@gmail.com"
    Purpose = "Study"
    Terraform = "yes"
}


