require_relative "shopping_app/seller"
require_relative "shopping_app/item"
require_relative "shopping_app/customer"

seller = Seller.new("DICストア")
10.times{ Item.new("CPU", 40830, seller) }
10.times{ Item.new("memoire", 13880, seller) }
10.times{ Item.new("carte mère", 28980, seller) }
10.times{ Item.new("Bloc d'alimentation", 8980, seller) }
10.times{ Item.new("boite d'ordinateur", 8727, seller) }
10.times{ Item.new("Disque dur 3,5 pouces", 10980, seller) }
10.times{ Item.new("SSD 2,5 pouces", 13370, seller) }
10.times{ Item.new("M.2 SSD", 12980, seller) }
10.times{ Item.new("Refroidisseur de processeur", 13400, seller) }
10.times{ Item.new("carte graphique", 23800, seller) }

puts "🤖 S'il vous plait, dites moi votre nom"
customer = Customer.new(gets.chomp)

puts "🏧 Veuillez entrer le montant pour charger le portefeuille"
customer.wallet.deposit(gets.chomp.to_i)

puts "🛍️ commencer à magasiner"
end_shopping = false
while !end_shopping do
  puts "📜 Liste de produits"
  seller.items_list

  puts "️️⛏ Veuillez entrer le numéro de produit"
  number = gets.to_i

  puts "⛏ Entrez la quantité de produit"
  quantity = gets.to_i

  items = seller.pick_items(number, quantity)

  items&.each{|item| customer.cart.add(item) }

  puts "🛒 Contenu du panier"
  customer.cart.items_list
  puts "🤑 montant total: #{customer.cart.total_amount}"

  puts "😭 terminer les achats？(yes/no)"
  end_shopping = gets.chomp == "yes"
end

puts "💸 Confirmer l'achat？(yes/no)"
customer.cart.check_out if gets.chomp == "yes"

puts "21 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ 21"
puts "️🛍️ ️#{customer.name}propriété de"
customer.items_list
puts "😱👛 #{customer.name}solde du portefeuille de: #{customer.wallet.balance}"

puts "📦 #{seller.name}état des stocks de"
seller.items_list
puts "😻👛 #{seller.name}solde du portefeuille de: #{seller.wallet.balance}"

puts "🛒 Contenu du panier"
customer.cart.items_list
puts "🌚 montant total: #{customer.cart.total_amount}"

puts "🎉 fin"
