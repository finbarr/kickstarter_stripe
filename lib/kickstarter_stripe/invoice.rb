module KickstarterStripe
  class Invoice < APIResource
    include KickstarterStripe::APIOperations::List
    include KickstarterStripe::APIOperations::Update
    include KickstarterStripe::APIOperations::Create

    def self.upcoming(params, api_key = nil)
      response, api_key = KickstarterStripe.request(:get, upcoming_url, api_key, params)
      Util.convert_to_stripe_object(response, api_key)
    end

    def pay
      response, api_key = KickstarterStripe.request(:post, pay_url, @api_key)
      refresh_from(response, api_key)
    end

    private

    def self.upcoming_url
      url + '/upcoming'
    end

    def pay_url
      url + '/pay'
    end
  end
end
