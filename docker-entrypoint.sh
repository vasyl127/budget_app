#!/bin/bash

set -e

/wait

bundle exec rails db:prepare
bundle exec rails s -b 0.0.0.0 -p 3000 -e development # tmp for staging setup