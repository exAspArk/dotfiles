alias spec='function _spec(){ [ -f tmp/rspec_runner  ] && bundle exec rspec_runner "$1" || bundle exec rspec "$1";  }; _spec'
