module Api
  module V0
    class BaseController < ApplicationController
      before_action :authenticate_user!
    end
  end
end
