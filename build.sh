#!/bin/bash 
set -e

PATH=/usr/local/ruby-2.1.2/bin:$PATH
LANG=ja_JP.UTF-8
LANGUAGE=ja_JP.UTF-8
LC_ALL=ja_JP.UTF-8

GIT_LOCATION=/usr/local/src/blog
REPO=git@github.com:tacahilo/blog.git
WWW_LOCATION=/var/www/blog
BUNDLE_GEMFILE=$GIT_LOCATION/Gemfile

# update_repo
[ -d $GIT_LOCATION ]      || mkdir -p $GIT_LOCATION
[ -d $GIT_LOCATION/.git ] || git clone $REPO $GIT_LOCATION
cd $GIT_LOCATION && git pull origin master

# build and sync
bundle install --path vendor --binstubs
bin/rake build
rsync -az --delete $GIT_LOCATION/_site/ $WWW_LOCATION
