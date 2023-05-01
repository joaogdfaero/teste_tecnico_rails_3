require 'rspec'
require_relative '/home/joao-desktop/Documents/GitHub/Testes Técnicos - Missão Vaga/teste_tecnico_rails_3/app/services/strings_to_hashs.rb'

RSpec.describe TesteTecnico do
  it 'Teste 01: convertendo strings para hashes' do
    input = "97905796671Maria Neusa de    1234"
    config_file_path = '/home/joao-desktop/Documents/GitHub/Testes Técnicos - Missão Vaga/teste_tecnico_rails_3/app/services/exemplo1.yaml'

    teste = TesteTecnico.new(input, config_file_path)
    result1 = teste.strings_to_hashs
    expect(result1).to eq({:cpf=>"97905796671", :name=>"Maria Neusa de", :value=>"1234"})
  end
end