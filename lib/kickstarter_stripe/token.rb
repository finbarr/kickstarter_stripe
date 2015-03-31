module KickstarterStripe
  class Token < APIResource
    include KickstarterStripe::APIOperations::Create
  end
end
