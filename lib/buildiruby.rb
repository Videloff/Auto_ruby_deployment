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

# create all usefull tools for a ruby directory (such as directories, files, masked files, ... )
# Dir.mkdir() = create directory || Dir.open() = create file || Dir.chr() = path
def create_environment
  Dir.chdir(".")
  Dir.mkdir("lib")
  File.open("README.md", "w")
  File.open("app.rb", "w")
  File.open(".env", "w") {|f|f.close }
  File.open("Gemfile", "w") {|f|f.write($gemfile_content) ; f.close}
  File.open(".gitignore", "w") {|f|f.write(".env") ; f.close}
end

# execute systems prompts
def execute_system_implementation
  system("bundle install")
  system("rspec --init")
end

create_environment
execute_system_implementation
