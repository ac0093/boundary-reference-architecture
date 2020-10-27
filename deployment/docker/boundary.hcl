disable_mlock = true

controller {
  name = "demo-controller-1"
  description = "A controller for a demo!"
  database {
      url = "env://BOUNDARY_PG_URL"
  }
}

worker {
  name = "demo-worker-1"
  description = "A default worker created demonstration"
  address = 127.0.0.1
  controllers = ["127.0.0.1"]
  #public_addr = "myhost.mycompany.com"
}


listener "tcp" {
  address = "10.0.0.1"
  purpose = "api"
  tls_disable = false
}

listener "tcp" {
  address = "10.0.0.1"
  purpose = "cluster"
  tls_disable = false
}

listener "tcp" {
    purpose = "proxy"
    tls_disable = true
}


kms "aead" {
  purpose = "root"
  aead_type = "aes-gcm"
  key = "sP1fnF5Xz85RrXyELHFeZg9Ad2qt4Z4bgNHVGtD6ung="
  key_id = "global_root"
}

kms "aead" {
  purpose = "worker-auth"
  aead_type = "aes-gcm"
  key = "8fZBjCUfN0TzjEGLQldGY4+iE9AkOvCfjh7+p0GtRBQ="
  key_id = "global_worker-auth"
}

kms "aead" {
  purpose = "recovery"
  aead_type = "aes-gcm"
  key = "8fZBjCUfN0TzjEGLQldGY4+iE9AkOvCfjh7+p0GtRBQ="
  key_id = "global_recovery"
}

