source "https://rubygems.org"

gem "amazing_print"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "date_by_example"
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"
gem "importmap-rails"
gem "money-rails"
gem "jbuilder"

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false
gem "propshaft"
gem "puma", ">= 5.0"
gem "rails", github: "rails/rails", branch: "main"
gem "rbs"
gem "solid_cable"
gem "solid_cache"
gem "solid_queue"
gem "sqlite3", ">= 2.1"
gem "stimulus-rails"
gem "tailwindcss-rails"

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development do
  gem "annotate"
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

group :development, :test do
  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "rspec-collection_matchers"
  gem "rspec-rails"
  gem "standard"
  gem "standard-rails"
end
