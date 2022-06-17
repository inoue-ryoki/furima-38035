class Order

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :house_number, :build_name, :telephone_number

  # ここにバリデーションの処理を書く

   validates :post_code, presence: true,format: {with: /\A\d{3}[-]\d{4}\z/}
   validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
   validates :city, presence: true
   validates :house_number, presence: true
   validates :telephone_number, presence: true,format: {with: /\A\d{11}\z/}
   validates :user_id, presence: true
   validates :item_id, presence: true


   def save
    # 購入者情報を保存し、変数buyerに代入する
    buyer = Buyer.create(user_id: user_id, item_id: item_id)

    # 住所を保存する
    Address.create(post_code: post_code, area_id: area_id, city: city, house_number: house_number, build_name: build_name, telephone_number: telephone_number, buyer_id: buyer.id)
    # donation_idには、変数donationのidと指定する
  end
end
