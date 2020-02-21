# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/releases
# for a list of version numbers.
FROM phusion/baseimage:0.11

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV RUBY_VERSION=2.4.4

RUN apt-get update && \
    apt-get install -y build-essential curl git gnupg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
    curl -sSL https://get.rvm.io | bash -s stable && \
    /bin/bash -l -c "rvm install ruby-${RUBY_VERSION}" && \
    /bin/bash -l -c "gem install bundler"

# run this command to install bundle
#    /bin/bash -l -c "cd /myappdir; bundle install"

# also use that template to run your scripts e.g. in cron:
# /bin/bash -l -c "cd /myappdir; ruby myscript.rb"
