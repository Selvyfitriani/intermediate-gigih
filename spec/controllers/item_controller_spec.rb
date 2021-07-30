require "./controllers/item_controller.rb"

describe 'ItemController' do
    context '#show_create_form' do
        it 'should render create item form' do
            controller = ItemController.new
            response = controller.show_create_form

            expected_view = ERB.new(File.read("./views/create_item.erb")).result(binding)
            expect(expected_view).to eq(response)
        end
    end
end