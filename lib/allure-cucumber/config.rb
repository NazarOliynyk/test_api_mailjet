require 'allure-cucumber'

module AllureCucumber
  # Allure allure-cucumber configuration
  class CucumberConfig < Allure::Config
    include Singleton
    extend Forwardable

    DEFAULT_GIT_PREFIX = 'VCS_LINK:'

    attr_accessor :vcs_prefix, :vcs_link_pattern

    def vsc_prefix
      @vcs_prefix || DEFAULT_SEVERITY_PREFIX
    end
  end
end

