require 'pry'

Dir['*.rb'].each do |file|
  require_relative file unless file == "todo_list_runner.rb"
end

