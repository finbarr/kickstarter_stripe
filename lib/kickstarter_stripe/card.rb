module KickstarterStripe
  class Card < APIResource
    include KickstarterStripe::APIOperations::Update
    include KickstarterStripe::APIOperations::Delete
    include KickstarterStripe::APIOperations::List

    def url
      if respond_to?(:recipient)
        "#{Recipient.url}/#{CGI.escape(recipient)}/cards/#{CGI.escape(id)}"
      elsif respond_to?(:customer)
        "#{Customer.url}/#{CGI.escape(customer)}/cards/#{CGI.escape(id)}"
      end
    end

    def self.retrieve(id, api_key=nil)
      raise NotImplementedError.new("Cards cannot be retrieved without a customer ID. Retrieve a card using customer.cards.retrieve('card_id')")
    end
  end
end
