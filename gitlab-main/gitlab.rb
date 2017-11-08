# Configuration file to go in /etc/gitlab/gitlab.rb
#
# See instructions and a complete example at
# https://github.com/gitlabhq/omnibus-gitlab/blob/master/files/gitlab-config-template/gitlab.rb.template
external_url 'https://gitlab.epfl.ch/'
nginx['listen_port'] = 80
nginx['listen_https'] = false
nginx['proxy_set_headers'] = {
  "X-Forwarded-Proto" => "https",
  "X-Forwarded-Ssl" => "on"
}

gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "mail.epfl.ch"
gitlab_rails['gitlab_email_from'] = 'noreply@epfl.ch'

postgresql['enable'] = false
gitlab_rails['db_adapter'] = "postgresql"
gitlab_rails['db_encoding'] = "unicode"
gitlab_rails['db_collation'] = nil
gitlab_rails['db_database'] = "gitlabhq_production"
gitlab_rails['db_pool'] = 10
gitlab_rails['db_username'] = "gitlab"
gitlab_rails['db_password'] = nil
gitlab_rails['db_host'] = nil
gitlab_rails['db_port'] = 5432
gitlab_rails['db_socket'] = nil
gitlab_rails['db_sslmode'] = nil
gitlab_rails['db_sslrootcert'] = nil

redis['enable'] = false
gitlab_rails['redis_socket'] = "/var/opt/gitlab/redis/redis.socket"

gitlab_rails['omniauth_enabled'] = true
gitlab_rails['omniauth_providers'] = [
  {
    "name" => "tequila",
    "args" => { "request_info" => {name: 'displayname', email: 'email', nickname: 'username'}, "service_name" => "gitlab" }
  }
]