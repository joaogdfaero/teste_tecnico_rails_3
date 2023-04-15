require 'rails_helper'
require_relative '/home/joao-desktop/Documents/GitHub/Testes Técnicos - Missão Vaga/teste_tecnico_rails_3/app/services/hashes_to_strings.rb'

RSpec.describe TesteTecnico do
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

    teste = TesteTecnico.new
    result1 = teste.hashs_to_string(hashes1)
    expect(result1).to eq("Maria Neusa97905796671Sao Paulo  1234       \nRicardo Fon44010762900Rio Grande 567        ")
  end
end