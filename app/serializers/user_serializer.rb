class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :nickname, :online
end
