require 'minitest/autorun'
require_relative '../pet_shop'

class TestPetShop < Minitest::Test

  def setup

# 0
    @customers = [
      {
        # 0
        name: "Alice",
        pets: [],
        cash: 1000
      },
      {
        # 1
        name: "Bob",
        pets: [],
        cash: 50
      }
    ]

# 1
    @new_pet = {
      # 0
      name: "Bors the Younger",
      pet_type: :cat,
      breed: "Cornish Rex",
      price: 100
    }

# 2
    @pet_shop = {
      # 0
      pets: [
        {
          # 0
          name: "Sir Percy",
          pet_type: :cat,
          breed: "British Shorthair",
          price: 500
        },
        {
          # 1
          name: "King Bagdemagus",
          pet_type: :cat,
          breed: "British Shorthair",
          price: 500
        },
        {
          # 2
          name: "Sir Lancelot",
          pet_type: :dog,
          breed: "Pomsky",
          price: 1000,
        },
        {
          # 3
          name: "Arthur",
          pet_type: :dog,
          breed: "Husky",
          price: 900,
        },
        {
          # 4
          name: "Tristan",
          pet_type: :dog,
          breed: "Basset Hound",
          price: 800,
        },
        {
          # 5
          name: "Merlin",
          pet_type: :cat,
          breed: "Egyptian Mau",
          price: 1500,
        }
      ],
      # 1
      admin: {
        total_cash: 1000,
        pets_sold: 0,
      },
      # 2
      name: "Camelot of Pets"
    }
  end

# print pet shop name - Camelot of Pets
def test_pet_shop_name
  name = pet_shop_name(@pet_shop)
  assert_equal("Camelot of Pets", name)
end

# print total amount of cash (@pet-shop > admin) - 1000
def test_total_cash
  sum = total_cash(@pet_shop)
  assert_equal(1000, sum)
end

# add money (10) to (@pet-shop > admin > total_cash) - 1010
def test_add_or_remove_cash__add
  add_or_remove_cash(@pet_shop,10)
  cash = total_cash(@pet_shop)
  assert_equal(1010, cash)
end

# remove money (10) from original total (admin > total_cash) - 990
def test_add_or_remove_cash__remove
  add_or_remove_cash(@pet_shop,-10)
  cash = total_cash(@pet_shop)
  assert_equal(990, cash)
end

# print (@pet-shop > admin > pets_sold)
def test_pets_sold
  sold = pets_sold(@pet_shop)
  assert_equal(0, sold)
end

# add (@pet-shop > admin > pets_sold) to 2
def test_increase_pets_sold
  increase_pets_sold(@pet_shop,2)
  sold = pets_sold(@pet_shop)
  assert_equal(2, sold)
end

# count how many pets (@petshop > pets)
def test_stock_count
  count = stock_count(@pet_shop)
  assert_equal(6, count)
end

# count how many british shorhair cats there are
def test_all_pets_by_breed__found
  pets = pets_by_breed(@pet_shop, "British Shorthair")
  assert_equal(2, pets.count)
end

# # count how many Dalmations there are
def test_all_pets_by_breed__not_found
  pets = pets_by_breed(@pet_shop, "Dalmation")
  assert_equal(0, pets.count)
end

# print dog name (@petshop > pets) look at all names to find Arther
def test_find_pet_by_name__returns_pet
  pet = find_pet_by_name(@pet_shop, "Arthur")
  assert_equal("Arthur", pet[:name])
end

# print dog name (@petshop > pets) look at all names to find fred change to retun nil
def test_find_pet_by_name__returns_nil
  pet = find_pet_by_name(@pet_shop, "Fred")
  assert_nil(pet)
end

# remove Arthur from (@petshop > pets)
def test_remove_pet_by_name
  remove_pet_by_name(@pet_shop, "Arthur")
  pet = find_pet_by_name(@pet_shop,"Arthur")
  assert_nil(pet)
end

# add pet to list, count pets
def test_add_pet_to_stock
  add_pet_to_stock(@pet_shop, @new_pet)
  count = stock_count(@pet_shop)
  assert_equal(7, count)
end

# print alice's cash amount
def test_customer_cash
  cash = customer_cash(@customers[0])
  assert_equal(1000, cash)
end

# remove alice's cash
def test_remove_customer_cash
  customer = @customers[0]
  remove_customer_cash(customer, 100)
  assert_equal(900, customer[:cash])
end

# count how many pets the customers have in total
def test_customer_pet_count
  count = customer_pet_count(@customers[0])
  assert_equal(0, count)
end

# add pet to alice, count how many pets
def test_add_pet_to_customer
  customer = @customers[0]
  add_pet_to_customer(customer, @new_pet)
  assert_equal(1, customer_pet_count(customer))
end

  # # OPTIONAL
# (>=) true or false  custom[:cash] >= pet [price] for bob
def test_customer_can_afford_pet__insufficient_funds
  customer = @customers[1]
  can_buy_pet = customer_can_afford_pet(customer, @new_pet)
  assert_equal(false, can_buy_pet)
end
#
# # change previous code to alice
def test_customer_can_afford_pet__sufficient_funds
  customer = @customers[0]
  can_buy_pet = customer_can_afford_pet(customer, @new_pet)
  assert_equal(true, can_buy_pet)
end

def (pet_type_shop, pet_customer )
  if pet !=nim && customer_can_afford(customer,pets)
    #These are 'integration' tests so we want multiple asserts.
    #If one fails the entire test should fail
    def test_sell_pet_to_customer__pet_found
      customer = @customers[0]
      pet = find_pet_by_name(@pet_shop,"Arthur")

      sell_pet_to_customer(@pet_shop, pet, customer)

      assert_equal(1, customer_pet_count(customer))
      assert_equal(1, pets_sold(@pet_shop))
      assert_equal(100, customer_cash(customer))
      assert_equal(1900, total_cash(@pet_shop))
    end

    def test_sell_pet_to_customer__pet_not_found
      customer = @customers[0]
      pet = find_pet_by_name(@pet_shop,"Dave")

      sell_pet_to_customer(@pet_shop, pet, customer)

      assert_equal(0, customer_pet_count(customer))
      assert_equal(0, pets_sold(@pet_shop))
      assert_equal(1000, customer_cash(customer))
      assert_equal(1000, total_cash(@pet_shop))
    end

    def test_sell_pet_to_customer__insufficient_funds
      customer = @customers[1]
      pet = find_pet_by_name(@pet_shop,"Arthur")

      sell_pet_to_customer(@pet_shop, pet, customer)

      assert_equal(0, customer_pet_count(customer))
      assert_equal(0, pets_sold(@pet_shop))
      assert_equal(50, customer_cash(customer))
      assert_equal(1000, total_cash(@pet_shop))
    end
  end
end
