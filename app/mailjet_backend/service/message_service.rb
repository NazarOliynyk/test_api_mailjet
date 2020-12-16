require_relative 'mailjet_base_service'

class MessageService < MailjetBaseService

  def get_all_messages(contact_email)
    HttpClient.get("#{@main_url}message?ContactAlt=#{contact_email}&Limit=1000",
                   { :authorization => "Basic #{@authorization_value}", :accept => :json, :content_type => :json })
  end

  def get_message_by_id(message_id)
    HttpClient.get("#{@main_url}message/#{message_id}",
                   { :authorization => "Basic #{@authorization_value}", :accept => :json, :content_type => :json })
  end

  def send_message(contact_email)
    @message_model["Messages"][0]["To"][0]["Email"] = contact_email
    HttpClient.post("#{@main_mailjet_sender_url}send", @message_model.to_json,
                   { :authorization => "Basic #{@authorization_value}", :accept => :json, :content_type => :json })

  end

end
