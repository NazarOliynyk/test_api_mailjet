require 'require_all'
require_all 'app'

Before('@MailjetFeature') do

  unless $api_setup_is_done
    create_logger('log/api/logs.txt')
    $api_setup_is_done = true
  end

  @mailjet_base_service = MailjetBaseService.new
  @template_service = TemplateService.new
  @message_service = MessageService.new
  @gmail_service = GmailService.new

  @messages_list_before_sending = 0
  @messages_list_after_sending = 0
  @messages_list_before_receiving = 0
  @messages_list_after_receiving = 0
  @last_message_id = 0
  @templates_list_before_create = 0
  @templates_list_after_create = 0
  @templates_list_after_delete = 0
  @last_template_id = 0
  @name_of_existing_template = ''

end

After('@Send_message') do
  @gmail_service.delete_all_messages_by_sender(@mailjet_base_service.gmail_login,
                                               @mailjet_base_service.gmail_password,
                                               @mailjet_base_service.mailjet_sender_email)
end

def get_total_size(response)
  JSON.parse(response)["Total"]
end

def get_id_last_template(response)
  JSON.parse(response)["Data"].last["ID"]
end

def get_name_of_template(response)
  JSON.parse(response)["Data"].last["Name"]
end

def get_error_message(response)
  JSON.parse(response)["ErrorMessage"]
end