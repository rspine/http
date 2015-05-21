module Spine
  module Http
    extend self

    autoload :Request, 'spine/http/request'
    autoload :Response, 'spine/http/response'

    def url(uri)
      Request.new(uri)
    end
  end
end
