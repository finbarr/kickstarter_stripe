module KickstarterStripe
  class ApplicationFeeRefund < APIResource
    include KickstarterStripe::APIOperations::Update
    include KickstarterStripe::APIOperations::List

    def url
      "#{ApplicationFee.url}/#{CGI.escape(fee)}/refunds/#{CGI.escape(id)}"
    end

    def self.retrieve(id, api_key=nil)
      raise NotImplementedError.new("Refunds cannot be retrieved without an application fee ID. Retrieve a refund using appfee.refunds.retrieve('refund_id')")
    end
  end
end
