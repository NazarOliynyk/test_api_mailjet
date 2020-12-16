Given('I have to make sure that there are templates in the list and get the id of the last existing template') do
  response_get_all_templates = @template_service.get_all_templates
  expect(response_get_all_templates.code).to eql(200)
  expect(get_total_size(response_get_all_templates).positive?).to eql(true)
  @last_template_id = get_id_last_template(response_get_all_templates)
  @name_of_existing_template = get_name_of_template(response_get_all_templates)
end

When('I updated the existing template') do
  response_on_update = @template_service.update_template(@last_template_id, @mailjet_base_service.new_template_name)
  expect(response_on_update.code).to eql(200)
end

Then('I should get it from the database and check if the template has been updated') do
  response_get_template_by_id = @template_service.get_template_by_id(@last_template_id)
  expect(get_name_of_template(response_get_template_by_id)).to eql(@mailjet_base_service.new_template_name)
end

When('I changed the field of the template back') do
  response_on_update_previous_data = @template_service.update_template(@last_template_id, @name_of_existing_template)
  expect(response_on_update_previous_data.code).to eql(200)
end

Then('I should get it from the database and check if the template has been updated to previous state') do
  response_get_template_by_id = @template_service.get_template_by_id(@last_template_id)
  expect(get_name_of_template(response_get_template_by_id)).to eql(@name_of_existing_template)
end

