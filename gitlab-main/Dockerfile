FROM gitlab/gitlab-ce
MAINTAINER STI-IT Ops <stiitops@groupes.epfl.ch>

ADD config/gitlab.yml /opt/gitlab/embedded/cookbooks/gitlab/templates/default/gitlab.yml.erb

# This may not be the smartest way of achieving this, but it does get
# omniauth-tequila to install, and therefore load, along with all the others:
RUN ln -s . /opt/gitlab/embedded/service/gem/ruby/2.3.0/bundler
RUN echo "gem 'omniauth-tequila', :git => 'https://github.com/gcmalloc/omniauth-tequila.git', :branch => 'master' " >> /opt/gitlab/embedded/service/gitlab-rails/Gemfile
RUN cd /opt/gitlab/embedded/service/gitlab-rails && bundle install
# To check that omniauth-tequila was indeed installed in the correct place:
# docker run --rm -it <image_hash> ls /opt/gitlab/embedded/service/gem/ruby/2.3.0/gems
