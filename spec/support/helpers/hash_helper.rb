require 'rspec/expectations'

module HashHelper
  extend RSpec::Matchers::DSL

  matcher :have_keys do |keys|
    match do |hash|
      keys.each do |key|
        expect(actual.keys).to include(key)
      end
    end
  end
end
