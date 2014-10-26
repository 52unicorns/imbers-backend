module Facebook
  class User
    attr_reader :params, :access_token

    class << self
      def find(access_token)
        client = Koala::Facebook::API.new(access_token)
        params = client.get_object('me')
        new(access_token, params)
      end
    end

    def initialize(client, params = {})
      @client = client
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

    def client
      @client ||= Koala::Facebook::API.new(access_token)
    end

    def location
      params.fetch(:location) { Hash.new }
    end
  end
end
