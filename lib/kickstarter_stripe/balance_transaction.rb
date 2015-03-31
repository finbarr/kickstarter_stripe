module KickstarterStripe
  class BalanceTransaction < APIResource
    include KickstarterStripe::APIOperations::List

    def self.url
      '/v1/balance/history'
    end
  end
end
