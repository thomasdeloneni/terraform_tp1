variable "student_name" {
  description = "Prénom et nom de l'étudiant, utilisé pour le nommage des ressources"
  type        = string
  default     = "thomas_delon"
}

variable "promo_name" {
  description = "Nom de la promotion ou du groupe"
  type        = string
  default     = "EADL-2026"
}

variable "environment" {
  description = "Environnement de déploiement"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "Région AWS cible"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Bloc CIDR du VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Bloc CIDR du sous-réseau public"
  type        = string
  default     = "10.10.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Bloc CIDR du sous-réseau privé"
  type        = string
  default     = "10.10.2.0/24"
}

variable "key_pair_name" {
  description = "Nom de la key pair AWS importée, utilisée pour les instances EC2"
  type        = string
  default     = "tf-thomas_delon-dev-key"
}
