variable "student_name" {
  description = "Prénom et nom de l'étudiant, utilisé pour le nommage des ressources"
  type        = string
}

variable "promo_name" {
  description = "Nom de la promotion ou du groupe"
  type        = string
}

variable "environment" {
  description = "Environnement de déploiement (dev, test ou prod)"
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "L'environnement doit être dev, test ou prod."
  }
}

variable "region" {
  description = "Région AWS cible"
  type        = string
  validation {
    condition     = var.region == "us-east-1"
    error_message = "Seule la région us-east-1 (Paris) est autorisée."
  }
}

variable "vpc_cidr" {
  description = "Bloc CIDR du VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "key_name" {
  description = "Nom de la key pair AWS importée, utilisée pour les instances EC2"
  type        = string
}

variable "subnets" {
  description = "Carte des sous-réseaux à créer dans le VPC"
  type = map(object({
    cidr_block = string
    az         = string
    public     = bool
  }))
  default = {
    public = {
      cidr_block = "10.10.1.0/24"
      az         = "us-east-1a"
      public     = true
    }
    private = {
      cidr_block = "10.10.2.0/24"
      az         = "us-east-1a"
      public     = false
    }
  }
}
