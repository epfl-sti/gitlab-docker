FROM gitlab/gitlab-ce:10.8.4-ce.0
MAINTAINER STI-IT Ops <stiitops@groupes.epfl.ch>

# node is a hidden dependency of "bundle exec rake db:migrate RAILS_ENV=production"
# The rest are debugging tools
RUN apt update && apt -y install nodejs iproute2 iputils-ping netcat-openbsd

# This may not be the smartest way of achieving this, but it does get
# omniauth-tequila to install, and therefore load, along with all the others:
RUN ln -s . /opt/gitlab/embedded/lib/ruby/gems/2.3.0/bundler
RUN echo "gem 'omniauth-tequila', :git => 'https://github.com/gcmalloc/omniauth-tequila.git', :branch => 'master' " >> /opt/gitlab/embedded/service/gitlab-rails/Gemfile
RUN cd /opt/gitlab/embedded/service/gitlab-rails && bundle install
# To check that omniauth-tequila was indeed installed in the correct place:
# docker run --rm -it <image_hash> ls /opt/gitlab/embedded/lib/ruby/gems/2.3.0/gems/

# HEALTHCHECK --start-period=600s CMD /opt/gitlab/bin/gitlab-healthcheck --fail
