require 'log4r'
require 'fileutils'

module CustomLogger
  class MyLogger
    attr_accessor :logger

    def initialize(file_path)
      @logger = Log4r::Logger.new('my_logger')
      format = Log4r::PatternFormatter.new(pattern: '[%d]: %l - %m')
      create_path(file_path)
      @logger.outputters << Log4r::FileOutputter.new('file', filename: file_path, formatter: format, trunc: true)
      @logger
    end

    def info(message)
        logger.info(message)
    end

    private

    def create_path(path)
      dirname = File.dirname(path)
      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end
    end

  end
end
