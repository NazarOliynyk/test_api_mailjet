Given('I have to get the size of the list of all templates') do
  response_get_all_templates = @template_service.get_all_templates
  expect(response_get_all_templates.code).to eql(200)
  @templates_list_before_create = get_total_size(response_get_all_templates)
end

When('I created a new template') do
  response_create_template = @template_service.create_template(@mailjet_base_service.template_model)
  expect(response_create_template.code).to eql(201)
end

Then('I should verify if the list of all templates increased by one') do
  response_get_all_templates = @template_service.get_all_templates
  expect(response_get_all_templates.code).to eql(200)
  @templates_list_after_create = get_total_size(response_get_all_templates)
  expect(@templates_list_after_create - @templates_list_before_create).to eql(1)
  @last_template_id = get_id_last_template(response_get_all_templates)
end

When('I deleted the last created template') do
  response_delete_template = @template_service.delete_template(@last_template_id)
  expect(response_delete_template.code).to eql(204)
end

Then('I should check if the list of all templates decreased by one') do
  response_get_all_templates = @template_service.get_all_templates
  expect(response_get_all_templates.code).to eql(200)
  @templates_list_after_delete = get_total_size(response_get_all_templates)
  expect(@templates_list_after_create - @templates_list_after_delete).to eql(1)
end
