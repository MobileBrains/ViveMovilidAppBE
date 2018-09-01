require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ViveMovilidAppBE
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Bogota'
    config.i18n.default_locale = :es

    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.autoload_paths += Dir[Rails.root.join('app', 'api' , '*')]

    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.log_tags  = [:subdomain, :uuid]
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
end

require "#{Rails.root}/lib/warden_strategies"