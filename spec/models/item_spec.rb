require "../../models/item.rb"
require "../../db/db_connector.rb"

describe Item do
    describe '#insert' do
        context 'when insert successful' do
            it 'should insert item into database' do
                item = Item.new(name: 'Apple Juice', price: 10000)
                item.save

                assert
            end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        end
    end
end
