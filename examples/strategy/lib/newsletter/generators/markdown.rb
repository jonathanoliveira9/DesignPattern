require 'forwardable'

module Newsletter
  module Generators
    class Markdown
      extend Forwardable

      def_delegators :@context, :title, :phrase

      def initialize(context)
        @context = context
      end

      def header
        %(# #{title})
      end

      def content
        phrase
      end

      def execute
        <<EOF
#{header}

#{content}
EOF
      end
    end
  end
end
