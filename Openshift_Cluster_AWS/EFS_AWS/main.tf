provider "aws" {
  region = var.aws_region
}

resource "aws_efs_file_system" "efs_server" {
  creation_token   = var.efs_name
  encrypted        = true
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode

  tags = merge(var.tags, {
    Name = var.efs_name
  })
}

resource "aws_efs_mount_target" "efs_mount" {
  for_each        = toset(var.subnet_ids)
  file_system_id  = aws_efs_file_system.efs_server.id
  subnet_id       = each.value
  security_groups = var.security_group_ids
}

resource "aws_efs_backup_policy" "efs_backup_policy" {
  file_system_id = aws_efs_file_system.efs_server.id

  backup_policy {
    status = var.enable_backup_policy ? "ENABLED" : "DISABLED"
  }
}
