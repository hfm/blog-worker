#!/bin/bash 
set -eux
PATH=/usr/local/src/blog/vendor/ruby/2.1.0/bin:/usr/local/ruby-2.1.0/bin:$PATH

LANG=en_US.UTF-8
LANGUAGE=en_US.UTF-8
LC_ALL=en_US.UTF-8

GIT_LOCATION=/usr/local/src/blog
REPO=git@github.com:Tacahilo/blog.git
WWW_LOCATION=/var/www/blog

update_repo() {
    [ -d $GIT_LOCATION ] || mkdir -p $GIT_LOCATION
    cd $GIT_LOCATION
    [ -d ./.git ] || git clone $REPO .
    git pull origin master
}

build() {
    BUNDLE_GEMFILE=$GIT_LOCATION/Gemfile
    [ -d ./.bundle ] || bundle install --path vendor
    bundle exec rake build
}

main() {
    update_repo
    build
    rsync -a --delete $GIT_LOCATION/_site/ $WWW_LOCATION
}

main
env
