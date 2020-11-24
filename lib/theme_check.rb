require "liquid/c"

require_relative "theme_check/analyzer"
require_relative "theme_check/check"
require_relative "theme_check/checks"
require_relative "theme_check/node"
require_relative "theme_check/offense"
require_relative "theme_check/tags"
require_relative "theme_check/theme"
require_relative "theme_check/visitor"

Dir[__dir__ + "/theme_check/checks/*.rb"].each { |file| require file }

module ThemeCheck
  def self.analyze(theme_root)
    analyzer = Analyzer.new(Theme.new(theme_root))
    analyzer.analyze_theme
    analyzer.offenses
  end
end
