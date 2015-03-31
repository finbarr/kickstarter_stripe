module KickstarterStripe
  class Transfer < APIResource
    include KickstarterStripe::APIOperations::List
    include KickstarterStripe::APIOperations::Create
    include KickstarterStripe::APIOperations::Update

    def cancel
      response, api_key = KickstarterStripe.request(:post, cancel_url, @api_key)
      refresh_from(response, api_key)
    end

    def cancel_url
      url + '/cancel'
    end

  end
end
