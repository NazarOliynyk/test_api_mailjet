module AllureCucumber
  # Cucumber tag parser helper methods
  module TagParser

    def add_method_link(tags)
      return [] unless AllureCucumber.configuration.vcs_link_pattern

      matching_links(tags, :vcs)
    end

    private

    # @return [Hash<Symbol, Regexp>]
    def reserved_patterns
      @reserved_patterns ||= {
          tms: /@#{AllureCucumber.configuration.tms_prefix}(?<tms>\S+)/,
          issue: /@#{AllureCucumber.configuration.issue_prefix}(?<issue>\S+)/,
          severity: /@#{AllureCucumber.configuration.severity_prefix}(?<severity>\S+)/,
          vcs: /@#{AllureCucumber.configuration.vcs_prefix}(?<vcs>\S+)/,
          flaky: /@flaky/,
          muted: /@muted/,
          known: /@known/,
      }
    end
  end
end
