# simplecov for code coverage
require 'simplecov'
SimpleCov.start do
  add_filter '/spec/support/cop_helper.rb'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'scss_lint_custom'

require 'byebug'

Dir[
  File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))
].each { |f| require f }

RSpec.configure do |config|
  # ignore things like focus: true if it would filter all examples
  config.run_all_when_everything_filtered = true
  config.before(:each) do
    # If running a linter spec, run the described linter against the CSS code
    # for each example. This significantly DRYs up our linter specs to contain
    # only tests, since all the setup code is now centralized here.
    if described_class && described_class <= SCSSLint::Linter
      initial_indent = scss[/\A(\s*)/, 1]
      normalized_css = scss.gsub(/^#{initial_indent}/, '')

      # Use the configuration settings defined by default unless a specific
      # configuration has been provided for the test.
      local_config =
        if respond_to?(:linter_config)
          linter_config
        else
          SCSSLint::Config.default.linter_options(subject)
        end

      subject.run(SCSSLint::Engine.new(code: normalized_css), local_config)
    end
  end
end
