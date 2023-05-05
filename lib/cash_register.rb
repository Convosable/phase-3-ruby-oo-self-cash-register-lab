require "pry"

class CashRegister 

    attr_accessor :discount, :total, :items, :last_transaction

    def initialize (discount=0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.last_transaction = price * quantity
        self.total += self.last_transaction
        quantity.times { self.items << title }
    end

    def apply_discount
        discount_percent = (100 - self.discount) / 100.0
        self.total = (self.total * discount_percent).to_i
        self.discount > 0 ? "After the discount, the total comes to $#{self.total}." : "There is no discount to apply."
    end
    
    def void_last_transaction
        self.total -= self.last_transaction
    end

end

t1 = CashRegister.new(20)