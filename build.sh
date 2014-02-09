#!/bin/bash 
set -eu

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

GIT_LOCATION=/usr/local/src/blog
REPO=git@github.com:Tacahilo/blog.git
WWW_LOCATION=/var/www/blog
BUNDLE_GEMFILE=$GIT_LOCATION/Gemfile

# update_repo
[ -d $GIT_LOCATION ] || mkdir -p $GIT_LOCATION
[ -d $GIT_LOCATION/.git ] || git clone $REPO $GIT_LOCATION
cd $GIT_LOCATION && git pull origin master

# build and sync
[ -d ./.bundle ] || bundle install --path vendor
bundle exec rake build
rsync -a --delete $GIT_LOCATION/_site/ $WWW_LOCATION
