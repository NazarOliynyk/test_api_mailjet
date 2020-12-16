require 'rest_client'

class HttpClient
  class << self

    def get(url, headers = nil, query_params = {}, timeout = 10)
      headers[:params] = query_params
      RestClient::Request.new(method: :get, url: url, headers: headers, timeout: timeout)
                                    .execute { |response, _request, _result| response }
    end

    def post(url, body = nil, headers = {}, timeout = 100)
      RestClient::Request.new(method: :post, url: url, payload: body, headers: headers, timeout: timeout)
                                    .execute { |response, _request, _result| response }
    end

    def put(url, body = nil, headers = {}, timeout = 10)
      RestClient::Request.new(method: :put, url: url, payload: body, headers: headers, timeout: timeout)
                                    .execute { |response, _request, _result| response }
    end

    def delete(url, headers = nil, body = nil,  timeout = 10)
      RestClient::Request.new(method: :delete, url: url, payload: body, headers: headers, timeout: timeout)
                                    .execute { |response, _request, _result| response }

    end
    end
end
