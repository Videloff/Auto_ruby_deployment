$gemfile_content = 

"source 'https://rubygems.org'
ruby '3.0.0'
gem 'rubocop', '~> 0.57.2'
gem 'rspec'
gem 'dotenv'
gem 'http'
gem 'nokogiri'
gem 'json'
gem 'pry'
gem 'launchy'"

# check if there is a argument in the prompt.
def check_user_input
  abort("Usage : rubydir 'dir_name'.") if ARGV.empty?
end

# check if there is only one argument in the prompt.
def check_input
  abort("Usage : rubydir 'dir_name'. Must be a single argument.") if ARGV.length > 1
end

# create all usefull tools for a ruby directory (such as directories, files, masked files, ... )
# Dir.mkdir() = create directory || Dir.open() = create file || Dir.chr() = path
def create_environment
  project_name = ARGV.first

  Dir.chdir(".")
  Dir.mkdir(project_name)
  Dir.chdir("./"+project_name)
  Dir.mkdir("lib")
  File.open("README.md", "w")
  File.open(".env", "w") { |f| f.close }
  File.open("Gemfile", "w") { |f| f.write($gemfile_content) ; f.close}
  File.open(".gitignore", "w") { |f| f.write(".env") ; f.close}
end

# execute systems prompts
def execute_system_implementation
  system("bundle install")
  system("rspec --init")
end

check_user_input
check_input
create_environment
execute_system_implementation