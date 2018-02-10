#!/bin/sh

rails_ver=$1

gem install --no-ri --no-rdoc rails -v $rails_ver
rbenv rehash
