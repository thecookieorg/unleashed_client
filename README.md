# Unleashed

![](https://res.cloudinary.com/manoylo/image/upload/v1600048806/unleashed-logo_s2plij.svg)

A Ruby wrapper for [Unleashed](https://www.unleashedsoftware.com/)

Check out [example app here](https://obscure-springs-18424.herokuapp.com/)
and example app [repo here](https://github.com/thecookieorg/unleashed_client_example).

## Documentation
The documentation for Unleashed API can be found [here](https://apidocs.unleashedsoftware.com)

## Supported Resources
This library supports the following resources:
* [SalesOrders](https://apidocs.unleashedsoftware.com/SalesOrders)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'unleashed_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install unleashed_client

## Getting Started

### 1. Unleashed API key and API ID

Before you can use the gem, you will have to register and get your API key and API ID. Check out [Unleashed get started page](https://apidocs.unleashedsoftware.com/) for more information.

### 2. Set your ENV
Set your API_KEY and API_ID as your environment variables. If you're managing your environment variables [dotenv](https://github.com/bkeepers/dotenv) add API_KEY=your_key and API_ID=your_id to your .env file, or if you're using something like [Figaro](https://github.com/laserlemon/figaro) set your API_KEY: your_key and your API_ID: your_id.

### 3. Use it
```ruby
require 'unleashed_client'

@client = UnleashedClient::SalesOrder.new(api_key: ENV['API_KEY'], api_id: ENV['API_ID'])
```

### Get total number of pages
This is useful if you need to iterate over all pages and get all the data:

```ruby
pages = @client.get_number_of_pages
```

### Get the first 200 sales orders
Returns the first 200 sales orders because page number 1 is the default:

```ruby
items = @client.get_first_200
```

### Get sales orders from a specific page
```ruby
your_page_number = 2

items = @client.get_orders_from_page(page_number: your_page_number)
```

Example usage:
You can combine get_orders_from_page with get_number_of_pages. This will allow you to loop through all available pages and get the data (for example, if you are creating records in your local database):

```ruby
require 'unleashed_client'

@client = UnleashedClient::SalesOrder.new(api_key: ENV['API_KEY'], api_id: ENV['API_ID'])

number_of_pages = @client.get_number_of_pages

number_of_pages.downto(1).each do |i|
    items = @client.get_orders_from_page(page_number: i)
    # do stuff with items
end
```

### Get sales orders details
Returns details of a particular sales order using sales order guid value (ex guid: E6E8163F-6911-40e9-B740-90E5A0A3A996)

```ruby
your_guid = "E6E8163F-6911-40e9-B740-90E5A0A3A996"
response = @client.get_details(guid: your_guid)

# response["Guid"] => "E6E8163F-6911-40e9-B740-90E5A0A3A996"
# response["OrderNumber"] => "SO-xxx"
# ...
```

## TODO
* Add better tests wth Rspec;

What has to be added for SalesOrders resource:
* creating new sales orders;
* complete a sales order;
* update a sales order;

Other resources to be added:
* [Customers](https://apidocs.unleashedsoftware.com/Customers);
* [Products](https://apidocs.unleashedsoftware.com/Products);
* [PurchaseOrders](https://apidocs.unleashedsoftware.com/Purchases);
* [SalesPersons](https://apidocs.unleashedsoftware.com/SalesPersons);
* [SalesPersons](https://apidocs.unleashedsoftware.com/SalesPersons);
* [SalesShipments](https://apidocs.unleashedsoftware.com/SalesShipments);
* [StockAdjustments](https://apidocs.unleashedsoftware.com/StockAdjustments);
* [WarehouseStockTransfers](https://apidocs.unleashedsoftware.com/WarehouseStockTransfers);

## Author
* Marko Manojlovic <marko.manojlovic.bg@gmail.com>
* [https://manoylo.me](https:/manoylo.me)
* [LinkedIn](https://www.linkedin.com/in/marko-manojlovic-mm/)