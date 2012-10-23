class BadgeServerController < ApplicationController
    layout false

    def bake_callback
      @assertion = BadgesEngine::Assertion.find(params[:id])
      respond_to do |format|
        if @assertion && @assertion.token == params[:token]
          format.html { render action: 'show' }
          format.json { render json: @assertion }
        else
          format.html {render text: 'Cannot access badge assertion.',  status: :unauthorized}
          format.json {
            error = {status: 'failure', error: 'unauthorized', reason: 'Cannot access badge assertion.'}
            render json: error, status: :unauthorized
          }
        end
      end
    end
end
