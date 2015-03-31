module KickstarterStripe
  class Account < SingletonAPIResource
    def deauthorize(client_id, opts={})
      api_key, headers = Util.parse_opts(opts)
      response, api_key = KickstarterStripe.request(:post, '/oauth/deauthorize', api_key, { 'client_id' => client_id, 'stripe_user_id' => self.id }, headers, KickstarterStripe.connect_base)
      Util.convert_to_stripe_object(response, api_key)
    end
  end
end
