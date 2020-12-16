require 'gmail'

class GmailService

  def get_number_of_messages_by_sender(gmail_login, gmail_password, sender)
    Gmail.connect(gmail_login, gmail_password) do |gmail|
      return gmail.inbox.count(from: sender).to_s if gmail.logged_in?
    end
  end

  def delete_all_messages_by_sender(gmail_login, gmail_password, sender)
    Gmail.connect(gmail_login, gmail_password) do |gmail|
      if gmail.logged_in?
        return gmail.inbox.find(from: sender).each(&:delete!)
      end
    end
  end
  
end
