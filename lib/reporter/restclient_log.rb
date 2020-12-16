require 'rest_client'
# require 'time_difference'

module RestClient

  class Response < String
    include AbstractResponse
    include RestClient
    include Reporter

    # override from RestClient::Response
    def log_response
      return unless log

      json_log = JSON.pretty_generate({RESPONSE: response_parameters})
      AllureAttachment.attach_file(json_log, 'response')
      log.info "=> #{json_log}\n"
    end

    def response_parameters
      {
        duration: duration.to_f.round(2),
        response_code: code,
        response_headers: headers,
        response_body: prepare_body(body)
      }
    end
  end

  class Request
    include RestClient
    include Reporter

    # override from RestClient::Request
    def log_request
      return unless log

      json_log = JSON.pretty_generate({REQUEST: request_parameters})
      AllureAttachment.attach_file(json_log, 'request')
      log.info "=> #{json_log}\n"
    end

    def request_parameters
      {
        request_url: url,
        request_method: method,
        request_headers: headers,
        request_body: prepare_body(payload.to_s)
      }
    end
  end

  def prepare_body(body)
    return unless body.present?

    begin
      JSON.parse(body)
    rescue StandardError => ex
      return body
    end
  end
end
