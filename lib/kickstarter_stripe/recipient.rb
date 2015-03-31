module KickstarterStripe
  class Recipient < APIResource
    include KickstarterStripe::APIOperations::Create
    include KickstarterStripe::APIOperations::Delete
    include KickstarterStripe::APIOperations::Update
    include KickstarterStripe::APIOperations::List

    def transfers
      Transfer.all({ :recipient => id }, @api_key)
    end
  end
end
