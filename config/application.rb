require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # To use Glyphicons
    # https://gascar-shunt.tumblr.com/post/65236279971/rails-4%E3%81%A7bootstrap-3-glyphicon%E5%95%8F%E9%A1%8C%E3%82%82%E8%A7%A3%E6%B1%BA
    config.assets.paths << "#{Rails}/vendor/assets/fonts"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
