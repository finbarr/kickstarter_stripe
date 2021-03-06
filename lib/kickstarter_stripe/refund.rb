module KickstarterStripe
  class Refund < APIResource
    include KickstarterStripe::APIOperations::Update
    include KickstarterStripe::APIOperations::List

    def url
      "#{Charge.url}/#{CGI.escape(charge)}/refunds/#{CGI.escape(id)}"
    end

    def self.retrieve(id, api_key=nil)
      raise NotImplementedError.new("Refunds cannot be retrieved without a charge ID. Retrieve a refund using charge.refunds.retrieve('refund_id')")
    end
  end
end
