require 'yaml'

module ConfigManager
  $APP_ROOT = File.expand_path('..', __dir__).freeze
  config_file = YAML.load_file("#{$APP_ROOT}/config/config.yml")


  $screenshot_each_step = true
  $log_each_step = true
end
