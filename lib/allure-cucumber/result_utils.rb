require "socket"

module Allure
  # Variouse helper methods
  module ResultUtils

    class << self

      def vcs_link(value)
        Link.new('vcs', value, method_url(value))
      end
      private

      def method_url(value)
        AllureCucumber.configuration.vcs_link_pattern + "/#{value}"
      end
    end
  end
end

