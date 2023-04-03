module "public_eks_cluster" {
    
  source         = "github.com/rui-armada/terraform-modules/aws-eks"
  vpc_name       = "my-VPC"
  cluster_name   = "my-EKS"
  desired_size   = 2
  max_size       = 2
  min_size       = 1
  instance_types = ["t3.medium"]
}

module "helm-release" {

  source     = "github.com/rui-armada/terraform-modules/helm-release"
  namespace = "steeleye"
  helmchart = "./helm"
  values = "./values.yaml"
  name = "helm"

  //depends_on = [module.metallb]
  
}
