require "csv"
require "cucumber/core"
require "cucumber/formatter/ast_lookup"


module AllureCucumber
  # Support class for transforming allure-cucumber test entities in to allure model entities
  class AllureCucumberModel
    include TagParser

    private

    # @param [Cucumber::Core::Test::Case] test_case
    # @return [Array<Allure::Link>]
    def links(test_case)
      tms_links(test_case.tags) + issue_links(test_case.tags) + add_method_link(test_case.tags)
    end
  end
end

