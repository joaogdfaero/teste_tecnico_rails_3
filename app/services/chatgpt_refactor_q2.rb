#!/usr/bin/env ruby
require 'yaml'

class TesteTecnico
  def initialize(data, config_file_path)
    @data = data
    @config = YAML.load_file(config_file_path)
  end

  def hashes_to_string
    formatted_hashes = @data.map do |hash|
      format_hash(hash, @config)
    end

    formatted_hashes.join("\n")
  end

  private

  def format_hash(hash, config)
    name = format_field(hash[:name], config['name'])
    cpf = format_field(hash[:cpf], config['cpf'])
    #state = format_field(hash[:state], config['state'])
    value = format_field(hash[:value], config['value'])

    #"#{name}#{cpf}#{state}#{value}"
    "#{name}#{cpf}#{value}"
  end

  def format_field(value, field_config)
    length = field_config['length']
    padding = field_config['padding'] == 'zeroes' ? '0' : ' '
    align = field_config['align'] == 'left' ? '-' : ''

    value.to_s.ljust(length, padding).rjust(length, align)
  end
end

input = [
  { name: 'Maria Neusa de Aparecida', cpf: '97905796671', state: 'Sao Paulo', value: '1234' },
  { name: 'Ricardo Fontes', cpf: '44010762900', state: 'Rio Grande do Sul', value: '567' }
]

config_file_path = 'exemplo1.yaml'

teste = TesteTecnico.new(input, config_file_path)
puts teste.hashes_to_string
