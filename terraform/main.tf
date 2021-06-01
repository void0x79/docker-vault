provider "vault" {
    address = "http://127.0.0.1"
}

# Write some terraform to configure vault here! 
# Docs here - https://registry.terraform.io/providers/hashicorp/vault/latest/docs

# Configure vaults unseal keys! SUPER IMPORTANT TOPIC TO UNDERSTAND
resource "null_resource" "get_keys" {
    provisioner "local-exec" {
        command = "vault operator init -key-shares=5 -key-threshold=2 output=json"
    }
}

# Example of a generic secret Key Value insertion.
resource "vault_generic_secret" "example" {
    path = "secret/foo"
    data_json = <<EOT
    {
        "username": "super_cool_username",
        "password": "You wish"
    }
    EOT
}

# Example Creating a Vault Namespace (Good for Multi-Tenancy)
resource "vault_namespace" "ns1" {
    path = "SuperDopeNameSpace"
}
