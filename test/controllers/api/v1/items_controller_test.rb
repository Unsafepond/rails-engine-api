require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#show" do
  	item = items(:two)
    get :show, id: item.id, format: :json
    
    assert_equal "this is an item", json_response["name"]
  end

  test "#index" do
    get :index, format: :json

    assert_equal 4, json_response.count
  end

  test "#find" do
    item = Item.create(name: "done")
    get :find, id: item.id, format: :json
    
    assert_equal "done", json_response["name"]
  end

  test "#find_all" do
    Item.create(name: "done")
    Item.create(name: "done")

    get :find_all, name: "done", format: :json
    
    assert_equal 2, json_response.count
  end

  test "#invoice_items" do
  	item = items(:two)
    invoice_item = InvoiceItem.create(unit_price: 1337, item_id: item.id)

    get :invoice_items, id: item.id, format: :json
    
    assert_equal 1337, json_response.first["unit_price"]
  end

   test "#merchant" do
  	item = items(:two)
    merchant = Merchant.create(name: "the dude")
    item.update_attributes(merchant_id: merchant.id)

    get :merchant, id: item.id, format: :json
    
    assert_equal "the dude", json_response["name"]
  end

  test "#most_revenue(quantity)" do
    item = items(:one)
    item2 = items(:two)
    item3 = items(:three)
    item4 = items(:four)
    invoice = Invoice.create(status: "shipped")
    invoice2 = Invoice.create(status: "shipped")
    invoice3 = Invoice.create(status: "shipped")
    invoice4 = Invoice.create(status: "pending")
    invoice_item = InvoiceItem.create(unit_price: 2000, quantity: 2, item_id: item.id, invoice_id: invoice.id)
    invoice_item2 = InvoiceItem.create(unit_price: 1000, quantity: 1, item_id: item2.id, invoice_id: invoice2.id)
    invoice_item3 = InvoiceItem.create(unit_price: 3000, quantity: 2, item_id: item3.id, invoice_id: invoice3.id)
    invoice_item4 = InvoiceItem.create(unit_price: 1000, quantity: 1, item_id: item4.id, invoice_id: invoice4.id)

    get :most_revenue, quantity: 3, format: :json
    
    assert_equal "dawg", json_response.first["name"]
    assert_equal "this is an item", json_response[2]["name"] 
  end

  test "#most_items(quantity)" do
    item = items(:one)
    item2 = items(:two)
    item3 = items(:three)
    item4 = items(:four)
    invoice = Invoice.create(status: "shipped")
    invoice2 = Invoice.create(status: "shipped")
    invoice3 = Invoice.create(status: "shipped")
    invoice4 = Invoice.create(status: "pending")
    invoice_item = InvoiceItem.create(unit_price: 2000, quantity: 2, item_id: item.id, invoice_id: invoice.id)
    invoice_item2 = InvoiceItem.create(unit_price: 1000, quantity: 1, item_id: item3.id, invoice_id: invoice2.id)
    invoice_item3 = InvoiceItem.create(unit_price: 3000, quantity: 2, item_id: item3.id, invoice_id: invoice3.id)
    invoice_item4 = InvoiceItem.create(unit_price: 1000, quantity: 1, item_id: item4.id, invoice_id: invoice4.id)

    get :most_items, quantity: 2, format: :json
    
    assert_equal "dawg", json_response.first["name"]
    assert_equal "item", json_response.last["name"] 
  end

  # test "#best_day" do
  #   time = Time.now
  #   item = items(:three)
  #   invoice = Invoice.create(status: "shipped", created_at: time)
  #   invoice2 = Invoice.create(status: "shipped", created_at: time)
  #   invoice3 = Invoice.create(status: "shipped", created_at: )
  #   invoice_item = InvoiceItem.create(unit_price: 2000, quantity: 2, item_id: item.id, invoice_id: invoice.id)
  #   invoice_item2 = InvoiceItem.create(unit_price: 1000, quantity: 1, item_id: item3.id, invoice_id: invoice2.id)
  #   invoice_item3 = InvoiceItem.create(unit_price: 3000, quantity: 2, item_id: item3.id, invoice_id: invoice3.id)
  #   invoice_item4 = InvoiceItem.create(unit_price: 1000, quantity: 1, item_id: item4.id, invoice_id: invoice4.id)

  #   get :most_items, quantity: 2, format: :json
    
  #   assert_equal "dawg", json_response.first["name"]
  #   assert_equal "item", json_response.last["name"] 
  # end
end
