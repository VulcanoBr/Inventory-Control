require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InventoryControl
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

   # config.time_zone = 'America/Sao_Paulo'

    config.time_zone = 'Brasilia'

    config.i18n.default_locale = 'pt-BR'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

   # Don't generate system test files.
    config.generators.system_tests = nil

  end
end