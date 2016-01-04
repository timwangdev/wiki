FROM ruby
MAINTAINER Yao Wang <tim.wangyao@gmail.com>

RUN apt-get -y update && apt-get -y install libicu-dev
# Remove next two lines in release.
RUN gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
RUN gem sources -l

RUN gem install gollum
RUN gem install redcarpet org-ruby github-markdown
VOLUME /wiki
WORKDIR /wiki
RUN git init /wiki
CMD ["gollum", "--port", "80", "--no-edit", "--css", "--js"]
EXPOSE 80