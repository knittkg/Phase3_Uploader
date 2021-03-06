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

    # http://d.hatena.ne.jp/gakeno_ueno_horyo/20150118/1421560645
    config.assets.paths << "#{Rails}/app/assets/fonts"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # glyphiconsが使っている*.eot *.svg *.ttf *.woffらを precompile の対象に含める
    config.assets.precompile += %w(*.eot *.svg *.ttf *.woff)
  end
end
