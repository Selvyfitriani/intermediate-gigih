require "./models/item.rb"
require "./db/db_connector.rb"

describe Item do
    describe '#insert' do
        context 'when insert successful' do
            it 'should insert item into database' do
                item = Item.new(name: 'Apple Juice', price: 10000)
               
                dummy_database = double
                allow(Mysql2::Client).to receive(:new).and_return(dummy_database)
                expect(dummy_database).to receive(:query).with(
                    'INSERT INTO' +  
                    ' items(name, price) ' + 
                    "values ('#{item.name}', #{item.price})"
                )

                item.save
            end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        end
    end
end
