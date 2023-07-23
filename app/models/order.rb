class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  def subtotal
    order_items.price * quantity
  end

  #enum status:{入金待ち: 0,入金確認:1,製作中:2,発送準備中:3, 発送済み:4}
  enum status: {wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish_prepare: 4}
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum making_status: {impossible_manufacture:0,waiting_manufacture:1,manufacturing:2,finish:3}
end
