require 'rspec'
require_relative '/home/joao-desktop/Documents/GitHub/Testes Técnicos - Missão Vaga/teste_tecnico_rails_3/app/services/hashs_to_strings_yaml.rb'


RSpec.describe TesteTecnico3 do
  it 'Teste 01: convertendo o primeiro conjunto de hashes' do
    hashes1 =
      [
        { name: 'Maria Neusa de Aparecida',
          cpf: '97905796671',
          state: 'Sao Paulo',
          value: '1234' },
        { name: 'Ricardo Fontes',
          cpf: '44010762900',
          state: 'Rio Grande do Sul',
          value: '567' }
      ]

    config_file_path = '/home/joao-desktop/Documents/GitHub/Testes Técnicos - Missão Vaga/teste_tecnico_rails_3/app/services/exemplo1.yaml'

    teste = TesteTecnico3.new(hashes1, config_file_path)
    result1 = teste.hashs_to_string_yaml
    expect(result1).to eq("Maria Neusa97905796671Sao Paulo  1234       \nRicardo Fon44010762900Rio Grande 567        ")
  end
end