Given('I have to make sure that there are templates in the list and get the name of the last existing template') do
  response_get_all_templates = @template_service.get_all_templates
  expect(response_get_all_templates.code).to eql(200)
  expect(get_total_size(response_get_all_templates).positive?).to eql(true)
  @name_of_existing_template = get_name_of_template(response_get_all_templates)
end

Then('I set to the template model existing name and verify the response') do
  @mailjet_base_service.template_model['Name'] = @name_of_existing_template
  response_save_existing_template = @template_service.create_template(@mailjet_base_service.template_model)
  expect(response_save_existing_template.code).to eql(400)
  expect(get_error_message(response_save_existing_template).include?('already exists')).to eql(true)
end


