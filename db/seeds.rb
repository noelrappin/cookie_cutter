Item.delete_all

Item.create(
  name: "Chocolate Chip",
  price_in_cents: 300
)

Item.create(
  name: "Oatmeal Raisin",
  price_in_cents: 250
)

Item.create(
  name: "Double Chocolate",
  price_in_cents: 400
)

Item.create(
  name: "Sugar",
  price_in_cents: 200
)

Person.create(
  name: "Clark Kent",
  email: "ckent@dailyplanet.com",
  address: Address.create(
    number: "305",
    street: "Clinton St.",
    city: "Metropolis",
    state: "DE"
  )
)

Person.create(
  name: "Bruce Wayne",
  email: "bwayne@waynetech.com",
  address: Address.create(
    number: "1",
    street: "Wayne Manor Ave",
    city: "Gotham City",
    state: "NJ"
  )
)
