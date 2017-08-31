gem_group :development, :test do
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'rspec'
  gem 'rspec-its'
  gem 'rspec-rails'
end

file '.rubocop.yml', <<-CODE
require: rubocop-rspec

inherit_from:
  - https://raw.githubusercontent.com/psu-stewardship/guides/master/style/ruby/.rubocop.yml
  - .rubocop_todo.yml

AllCops:
  TargetRubyVersion: 2.3
  Exclude:
    - 'db/**/*'
    - 'script/**/*'
    - 'tmp/**/*'
    - 'vendor/**/*'
CODE

run 'touch .rubocop_todo.yml'

after_bundle do
  generate "rspec:install"
  run "bundle exec rubocop -a"
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial Rails application setup' }
end
