provider "vault" {
    address = "http://127.0.0.1"
}

# Write some terraform to configure vault here! 
# Docs here - https://registry.terraform.io/providers/hashicorp/vault/latest/docs

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
