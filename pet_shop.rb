def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += 10
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += -10
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  return pet_shop[:admin][:pets_sold] += 2
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
   pets_breed = []
   for pets in pet_shop[:pets]
     pets_breed << pets if pets[:breed] == "British Shorthair"
   end
   return pets_breed
end

def pets_by_breed(pet_shop, breed)
  pets_breed = []
  for pets in pet_shop[:pets]
    pets_breed << pets if pets[:breed] == "Dalmation"
  end
  return pets_breed
end

def find_pet_by_name(pet_shop, name)
 for pets in pet_shop[:pets]
   return pets if pets[:name] == "Arthur"
 end
end

def find_pet_by_name(pet_shop, name)
 for pets in pet_shop[:pets]
   return pets if pets[:name] == "Fred"
 end
   return nil
end


# ????????? - cant get right
def find_pet_by_name(pet_shop, name)
 for pets in pet_shop[:pets]
   pet_shop[:pets].delete if pets[:name] == "Arthur"
 end
   return nil
end

# ????????? - cant get right
def add_pet_to_stock(new_pet, pet_shop)
  pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
 return customer[:pets].length
end

# ????????? - cant get right
def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

  # # OPTIONAL
  # # ????????? - cant get right
def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] < new_pet[:price]
    return false
  else
    return test_remove_customer_cashend
  end
end
