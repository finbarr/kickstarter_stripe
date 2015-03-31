module KickstarterStripe
  class Coupon < APIResource
    include KickstarterStripe::APIOperations::Create
    include KickstarterStripe::APIOperations::Update
    include KickstarterStripe::APIOperations::Delete
    include KickstarterStripe::APIOperations::List
  end
end
