require_all 'config'
require_all 'lib'
# require_relative  'C:\Z_RubyProjects\mail_handling\test_api_mailjet\lib\json_handler.rb'
# require_relative  'C:\Z_RubyProjects\mail_handling\test_api_mailjet\config\config_manager.rb'
# require_relative  'C:\Z_RubyProjects\mail_handling\test_api_mailjet\lib\rest_client\http_client.rb'

require 'base64'

class MailjetBaseService

  include ConfigManager
  include JsonHandler
  include Reporter

  attr_accessor :message_model,
                :template_model,
                :contact_property_model,
                :main_url,
                :main_mailjet_sender_url,
                :default_login,
                :default_password,
                :authorization_value,
                :gmail_login,
                :gmail_password,
                :mailjet_sender_email,
                :new_template_name

  def initialize
      @message_model = read_from_json("#{ $APP_ROOT}/app/mailjet_backend/model/message.json")
      @template_model = read_from_json("#{ $APP_ROOT}/app/mailjet_backend/model/template.json")
      @contact_property_model = read_from_json("#{ $APP_ROOT}/app/mailjet_backend/model/contact_property_object.json")
      @main_url = $default_mailjet_data[:main_url]
      @main_mailjet_sender_url = $default_mailjet_data[:main_mailjet_sender_url]
      @default_login = $default_mailjet_data[:default_login]
      @default_password = $default_mailjet_data[:default_password]
      @authorization_value = Base64.strict_encode64("#{@default_login}:#{@default_password}")
      @gmail_login =  $default_mailjet_data[:gmail_login]
      @gmail_password =  $default_mailjet_data[:gmail_password]
      @mailjet_sender_email = $default_mailjet_data[:mailjet_sender_email]
      @new_template_name = $default_mailjet_data[:new_template_name]

  end
end

