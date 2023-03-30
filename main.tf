
module "public_eks_cluster" {
    
  source         = "github.com/rui-armada/terraform-modules/aws-eks"
  vpc_name       = "my-VPC"
  cluster_name   = "my-EKS"
  desired_size   = 2
  max_size       = 2
  min_size       = 1
  instance_types = ["t3.medium"]
}

module "lb-nginx" {

  source     = "github.com/rui-armada/terraform-modules/helm-lb"
  cluster_id = module.public_eks_cluster.id
}
