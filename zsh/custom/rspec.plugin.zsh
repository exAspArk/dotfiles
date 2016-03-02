alias rr='function _rr(){ local pattern=${1:=.} ; [ -f tmp/rspec_runner ] && bundle exec rspec_runner "$pattern" || bundle exec rspec "$pattern"; }; _rr'
