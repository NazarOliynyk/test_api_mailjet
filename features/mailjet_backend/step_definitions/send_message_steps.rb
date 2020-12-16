Given('I have to get the size of the list of all sent messages and the size of list of all received messages') do
  response_all_sent_messages = @message_service.get_all_messages(@mailjet_base_service.gmail_login)
  @messages_list_before_sending = get_total_size(response_all_sent_messages)
  @messages_list_before_receiving = @gmail_service.get_number_of_messages_by_sender(@mailjet_base_service.gmail_login,
                                                                                   @mailjet_base_service.gmail_password,
                                                                                   @mailjet_base_service.mailjet_sender_email)
end

When('I sent a new message') do
  response_send_message = @message_service.send_message(@mailjet_base_service.gmail_login)
  expect(response_send_message.code).to eql(200)
end

Then('I should verify if the list of all sent messages increased by one') do
  sleep(2)
  response_all_sent_messages = @message_service.get_all_messages(@mailjet_base_service.gmail_login)
  @messages_list_after_sending = get_total_size(response_all_sent_messages)
  expect(@messages_list_after_sending - @messages_list_before_sending).to eql(1)
end

Then('I should verify if the list of received messages increased by one') do
  sleep(5)
  @messages_list_after_receiving = @gmail_service.get_number_of_messages_by_sender(@mailjet_base_service.gmail_login,
                                                                                    @mailjet_base_service.gmail_password,
                                                                                    @mailjet_base_service.mailjet_sender_email)
  expect(@messages_list_after_receiving.to_i - @messages_list_before_receiving.to_i).to eql(1)
end
