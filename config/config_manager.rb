require 'yaml'

module ConfigManager
  $APP_ROOT = File.expand_path('..', __dir__).freeze
  config_file = YAML.load_file("#{$APP_ROOT}/config/config.yml")

  $api_base_url = config_file['library_base_url']
  $ui_base_url = config_file['ui_base_url']
  $screenshot_each_step = true
  $log_each_step = true
end
