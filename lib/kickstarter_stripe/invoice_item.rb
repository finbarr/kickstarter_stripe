module KickstarterStripe
  class InvoiceItem < APIResource
    include KickstarterStripe::APIOperations::List
    include KickstarterStripe::APIOperations::Create
    include KickstarterStripe::APIOperations::Delete
    include KickstarterStripe::APIOperations::Update
  end
end
