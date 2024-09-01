output "efs_file_system_id" {
  description = "The ID of the EFS file system."
  value       = aws_efs_file_system.efs_server.id
}

output "efs_mount_target_ids" {
  description = "The IDs of the EFS mount targets."
  value       = aws_efs_mount_target.efs_mount.*.id
}
