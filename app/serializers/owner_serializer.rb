class OwnerSerializer < ActiveModel::Serializer
    # has_many :rental_houses

    attributes :email
    attributes :first_name
    attributes :last_name
  #以下はテスト用, 本番になったらコメントアウト
    attributes :id
end