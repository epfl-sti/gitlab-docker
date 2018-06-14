# Configuration file to go in /etc/gitlab/gitlab.rb
#
# These values are fed into the Chef configuration in the so-called
# Omnibus system
# (/opt/gitlab/embedded/cookbooks/cache/cookbooks/gitlab/templates/default/gitlab.yml.erb)
# to produce various configuration files, and in particular
# /opt/gitlab/embedded/nodes/gitlab.json
#
# See instructions and a complete example at
# https://github.com/gitlabhq/omnibus-gitlab/blob/master/files/gitlab-config-template/gitlab.rb.template
#
# To effect changes in this file, you have to restart the Docker
# container. Note: the documented instruction ("gitlab-ctl
# reconfigure") does *not* work because gitlab.rb is mounted as a
# single-file volume, and the changes to it are *not* visible from
# already-running Docker containers (unlike what would happen if the
# volume was a directory)
external_url (ENV["ENVIRONMENT"] == "staging" ? 'https://gitlab.epfl.ch:444/' : 'https://gitlab.epfl.ch/')
nginx['listen_port'] = 80
nginx['listen_https'] = false
nginx['proxy_set_headers'] = {
  "X-Forwarded-Proto" => "https",
  "X-Forwarded-Ssl" => "on"
}

gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "mail.epfl.ch"
gitlab_rails['gitlab_email_from'] = 'noreply@epfl.ch'
# You don't want the default setting, and there appears to be no way to not set a reply-to at all:
gitlab_rails['gitlab_email_reply_to'] = 'noreply@epfl.ch'

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
gitlab_rails['omniauth_allow_single_sign_on'] = true
gitlab_rails['omniauth_block_auto_created_users'] = false
gitlab_rails['omniauth_providers'] = [
  {
    "name" => "tequila",
    "args" => {
      "request_info" => {name: 'displayname', email: 'email', nickname: 'username'},
      "service_name" => "gitlab",
      "additional_parameters" => {allows: "categorie=epfl-guests"}
    }
  }
]
