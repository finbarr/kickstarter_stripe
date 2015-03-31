module KickstarterStripe
  class Plan < APIResource
    include KickstarterStripe::APIOperations::Create
    include KickstarterStripe::APIOperations::Delete
    include KickstarterStripe::APIOperations::List
    include KickstarterStripe::APIOperations::Update
  end
end
