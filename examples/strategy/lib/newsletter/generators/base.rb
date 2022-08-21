module Newsletter
  module Generators
    class Base
      attr_reader :format, :title, :phrase

      def initialize(format = :html)
        @format = format
        @title = 'Hello World!'
        @phrase = 'lorem ipsum'
      end

      def render
        constant = self.class.to_s.gsub('::Base', '')
        name = "#{constant}::#{format.to_s.capitalize}"
        strategy = Object.const_get(name).new self
        strategy.execute
      end

      def header
        raise NotImplementedError
      end

      def content
        raise NotImplementedError
      end
    end
  end
end
