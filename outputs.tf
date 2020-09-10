//TODO: Prasanna - Remove this output after finding a better testing strategy
output "mongo_instance_public_ip" {
  value = aws_instance.mongo-ecs-instance.public_ip
}

output "mongo_instance_private_ip" {
  value = aws_instance.mongo-ecs-instance.private_ip
}

output "mongo_instance_id" {
  value = aws_instance.mongo-ecs-instance.id
}

output "ecs_cluster_arn" {
  value = aws_ecs_cluster.mongo_ecs.arn
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.mongo_ecs.name
}

output "ecs_cluster_region" {
  value = var.region
}

output "ecs_ec2_role" {
  value = {
    name = aws_iam_role.ecs-ec2-role.name
    arn = aws_iam_role.ecs-ec2-role.arn
  }
}

output "iam_instance_profile" {
  value = {
    name = aws_iam_instance_profile.default.name
    arn = aws_iam_instance_profile.default.arn
  }
}
