module Oauth
  class TestsController < ApplicationController
    before_action :authenticate_user!

    def show
      render json: {}, status: :ok
    end
  end
end
