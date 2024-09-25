#Configurações da instancia
resource "aws_launch_template" "this" {
    name_prefix                 = "this"
    image_id                    = var.ami_aws_instance
    instance_type               = var.type_aws_instance
    key_name                    = var.key_aws_instance

  user_data = base64encode(
  templatefile("./WordpressTurbinado/ec2_setup.sh", 
  {
    wp_db_name        = aws_db_instance.web.name
    wp_username       = aws_db_instance.web.username
    wp_user_password  = aws_db_instance.web.password
    wp_db_host        = aws_db_instance.web.address 
  }))
    
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.allow_ssh.id]
  }

  monitoring { 
    enabled = true
  }

    tag_specifications {
      resource_type = "instance"
      tags = merge(local.common_tags, {
        Name = "Wordpress-Turbinado"
      })
    }
  
}

