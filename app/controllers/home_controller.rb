class HomeController < ApplicationController

    def index
        @assertions = BadgesEngine::Assertion.all

        respond_to do |format|
          format.html # index.html.erb
        end
    end

end
