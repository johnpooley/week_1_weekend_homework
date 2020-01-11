def pet_shop_name(shop_name)
  name_of_shop = shop_name[:name]
  return name_of_shop
end

def total_cash(shop_name)
  wonga = shop_name[:admin][:total_cash]
  return wonga
end

def add_or_remove_cash(shop, cash)
  new_total = shop[:admin][:total_cash]+cash
  shop[:admin][:total_cash] = new_total
end

def pets_sold(pet_shop)
  pets = pet_shop[:admin][:pets_sold]
  return pets
end

def increase_pets_sold(shop,number_sold)
  new_total = shop[:admin][:pets_sold]+number_sold
  shop[:admin][:pets_sold] = new_total
end

def stock_count(shop)
  stock = 0
  for pet in shop[:pets]
    stock = stock + 1
  end
  return stock
end

def pets_by_breed(shop, breed)
  total = []
  for pet in shop[:pets]
    if pet[:breed] == breed
      total.push("doggy")

    end
  end
  return total
end

def find_pet_by_name(shop, name)
total = []
  for pet in shop[:pets]
    if pet[:name] == name
      total.push(pet)
    end
    # else
    #   return nil

  end
  return total[0]
end

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
      pet.delete(:name)
    end
  end

end

def add_pet_to_stock(shop, new_pet)

shop[:pets] << new_pet

end

def customer_cash(customer)

  cash = customer[:cash]
  return cash
end

def remove_customer_cash(customer, cash)

  new_total = customer[:cash] - cash
  customer[:cash] = new_total
end

def customer_pet_count(customer)
  total = 0
  for pet in customer[:pets]
    total = total +1
  end
  return total
end

def add_pet_to_customer(customer, pet)
 customer[:pets]  << pet
end

def customer_can_afford_pet(money, cost)
  if money[:cash] >= cost[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(shop, pet, customer)

  return nil unless pet
  return nil unless customer_can_afford_pet(customer, pet)
  # can_i_have_pet = find_pet_by_name(shop, pet)
  #
  # liquidity = customer_can_afford_pet(customer, pet)
  #
  # pet_in_stock = false
  #
  # if can_i_have_pet == pet
  #   pet_in_stock = true
  # else
  #   pet_in_stock = false
  # end
  #
  # if liquidity ==  true  && pet_in_stock == true
  # # if customer_can_afford_pet(customer, pet) = true
  add_pet_to_customer(customer, pet)
  remove_customer_cash(customer, pet[:price])
  increase_pets_sold(shop, 1)
  remove_pet_by_name(shop, pet)
  add_or_remove_cash(shop, pet[:price])
    # else
      # return false
  end



# def credit_check()
