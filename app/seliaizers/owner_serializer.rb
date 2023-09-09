class OwnerSerializer < ActiveModel::Serializer
    attributes :email
    attributes :first_name
    attributes :last_name
end