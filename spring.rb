begin
  require 'spring-commands-rspec'
rescue LoadError
end

Spring.watch 'spec/factories'
