require 'net/http'
require 'spine/content_types'

module Spine
  module Http
    class Request
      attr_reader :uri, :headers

      def initialize(uri)
        @uri = URI.parse(uri)
        @headers = {}
        @payload = ''
      end

      def query(parameters)
        uri.query = URI.encode_www_form(parameters)
        self
      end

      def header(key, value)
        headers[key] = value
        self
      end

      def payload(data, content_type = ContentTypes::Plain)
        @payload = content_type.dump(data)
        self
      end

      def get
        execute(Net::HTTP::Get.new(uri.request_uri))
      end

      def post
        request = Net::HTTP::Post.new(uri.request_uri)
        add_payload(request)
        execute(request)
      end

      def patch
        request = Net::HTTP::Patch.new(uri.request_uri)
        add_payload(request)
        execute(request)
      end

      def put
        request = Net::HTTP::Put.new(uri.request_uri)
        add_payload(request)
        execute(request)
      end

      def delete
        request = Net::HTTP::Delete.new(uri.request_uri)
        execute(request)
      end

      private

      def add_payload(request)
        if @payload.is_a?(Hash)
          request.set_form_data(@payload)
        else
          request.body = @payload
        end
      end

      def add_headers(request)
        headers.each do |key, value|
          request[key] = value
        end
      end

      def execute(request)
        add_headers(request)
        Response.new(http.request(request))
      end

      def http
        @http ||= build_connection
      end

      def build_connection
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == 'https')
        http
      end
    end
  end
end
