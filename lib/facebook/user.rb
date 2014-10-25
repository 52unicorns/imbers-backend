module Facebook
  class User
    attr_reader :params

    def initialize(params = {})
      @params = params.symbolize_keys!
    end

    def id
      params[:id]
    end

    def first_name
      params[:first_name]
    end

    def last_name
      params[:last_name]
    end

    def gender
      params[:gender]
    end

    def birthday
      params[:birthday]
    end

    def location_id
      location[:id]
    end

    def location_name
      location[:name]
    end

    private

    def location
      params.fetch(:location) { Hash.new }
    end
  end
end
