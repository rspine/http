require 'spine/content_types'

module Spine
  module Http
    class Response
      attr_reader :raw

      def initialize(raw)
        @raw = raw
      end

      def code
        raw.code
      end

      def is?(status)
        raw.is_a?(status)
      end

      def body(content_type = ContentTypes::Plain)
        content_type.load(raw.body)
      end
    end
  end
end
