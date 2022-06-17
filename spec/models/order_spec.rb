require 'rails_helper'

RSpec.describe Order, type: :model do
   describe '商品情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id,item_id: item.id)
        sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order).to be_valid


      end

      it 'build_nameは空でも保存できること' do
       @order.build_name = ''
        expect(@order).to be_valid


      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.post_code = '1111111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it 'area_idを選択していないと保存できないこと' do
        @order.area_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
        it 'house_numberが空だと保存できないこと' do
        @order.house_number = ''
        @order.valid?

        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      it 'telephone_numberが1円未満では保存できないこと' do
        @order.telephone_number = ''
        @order.valid?

        expect(@order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁以上11桁以内のみ保存可能なこと' do
        @order.telephone_number = '111111111'
        @order.valid?


        expect(@order.errors.full_messages).to include("Telephone number is invalid")
      end

        it 'telephone_numberが半角数値のみ保存可能なこと' do
        @order.telephone_number = '１１１１１１１１１１'
        @order.valid?

        expect(@order.errors.full_messages).to include("Telephone number is invalid")
      end

        it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

        it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
