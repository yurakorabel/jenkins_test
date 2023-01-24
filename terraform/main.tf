provider "aws" {
  region = "eu-central-1"
  access_key = "Your access_key"
  secret_key = "Your secret_key"
}

module "AWS_VM" {
  source = "github.com/yurakorabel/DevOps_GL_Hometask/Task6/modules/AWS"
  # ==== AWS CONFIG VARS ====
  # --- AMI ---
  # ami_owner     = "099720109477"
  # ami_image     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
  # --- Instance ---
  # instance_type = "t2.micro"
  # user_data     = "user_data.sh"
  # --- SSH Key ---
  # public_key    = "~/.ssh/id_rsa.pub"
  # =========================
}

output "AWS_public_ip" {
  value = module.AWS_VM.ec2_ip
}

resource "local_file" "hosts_cfg" {
  content = templatefile("../ansible_deploy/tpl/hosts.tpl",
    {
      ubuntu_ip = module.AWS_VM.ec2_ip
    }
  )
  filename = "../ansible_deploy/hosts.cfg"
}
