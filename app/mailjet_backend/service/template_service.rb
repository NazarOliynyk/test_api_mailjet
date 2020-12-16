require_relative 'mailjet_base_service'

class TemplateService < MailjetBaseService

  def get_all_templates
    HttpClient.get("#{@main_url}template",
                   { :authorization => "Basic #{@authorization_value}", :accept => :json, :content_type => :json })
  end

  def get_template_by_id(template_id)
    HttpClient.get("#{@main_url}template/#{template_id}",
                   { :authorization => "Basic #{@authorization_value}", :accept => :json, :content_type => :json })
  end

  def create_template(template_model)
    HttpClient.post("#{@main_url}template", template_model.to_json,
                   { :authorization => "Basic #{@authorization_value}", :accept => :json, :content_type => :json })
  end

  def delete_template(template_id)
    HttpClient.delete("#{@main_url}template/#{template_id}",
                    { :authorization => "Basic #{@authorization_value}", :accept => :json, :content_type => :json })
  end

  def update_template(template_id, new_template_name)
    @template_model["Name"] = new_template_name
    HttpClient.put("#{@main_url}template/#{template_id}", @template_model.to_json,
                      { :authorization => "Basic #{@authorization_value}", :accept => :json, :content_type => :json })
  end

end
