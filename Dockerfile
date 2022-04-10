FROM phusion/passenger-customizable:2.2.0
MAINTAINER Tony Senik "tony.senik@gmail.com"

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

RUN /pd_build/ruby-3.1.1.sh

RUN bash -lc 'rvm install 3.1.1'
RUN bash -lc 'rvm --default use ruby-3.1.1'

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default

# For Mac OS permissions
RUN usermod -u 1000 app
RUN usermod -G staff app

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -

RUN rm -rf /var/lib/apt/lists/* && apt-get update -qq && apt-get install -y libpq-dev \
    build-essential \
    unzip \
    libcurl4-openssl-dev \
    cmake \
    nodejs

RUN npm install --global yarn
COPY docker/nginx/sites-enabled/*.conf /etc/nginx/sites-enabled/

RUN mkdir /home/app/robo_example_dev
ADD . /home/app/robo_example_dev
WORKDIR /home/app/robo_example_dev

RUN gem install bundler

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
