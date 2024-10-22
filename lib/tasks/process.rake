task process: :environment do
  BatchCheckout.new("data/test.json").process
end
