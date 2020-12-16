require 'JSON'

module JsonHandler

  def read_from_json(path)
    JSON.load(File.open(path))
  rescue JSON::ParserError =>  err
    log_error("Rescued: #{err.inspect}")
  end

end
