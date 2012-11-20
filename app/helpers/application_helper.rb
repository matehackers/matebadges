module ApplicationHelper
    def baking_url assertion, type = 'json'
      origin_uri = URI.parse(BadgesEngine::Configuration.issuer.origin)
      badge_server_url(:id => assertion.id, :token => assertion.token, :host => origin_uri.host) + '.' + type
    end
end
