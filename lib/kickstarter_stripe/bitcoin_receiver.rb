module KickstarterStripe
  class BitcoinReceiver < APIResource
    include KickstarterStripe::APIOperations::Create
    include KickstarterStripe::APIOperations::List

    def self.url
      "/v1/bitcoin/receivers"
    end
  end
end
