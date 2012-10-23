module HomeHelper

    def baking_url assertion
      origin_uri = URI.parse(BadgesEngine::Configuration.issuer.origin)
      badge_server_url(:id => assertion.id, :token => assertion.token, :host => origin_uri.host)
    end

end
