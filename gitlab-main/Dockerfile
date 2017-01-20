FROM gitlab/gitlab-ce
MAINTAINER STI-IT Ops <stiitops@groupes.epfl.ch>

RUN gem install omniauth-tequila
ADD config/gitlab.yml /opt/gitlab/embedded/cookbooks/gitlab/templates/default/gitlab.yml.erb
