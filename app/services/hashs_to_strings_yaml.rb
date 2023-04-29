#!/usr/bin/env ruby
require 'yaml'
class TesteTecnico3
  def initialize(data, config_file_path)
    @data = data
    @config = YAML.load_file(config_file_path)
  end

  def hashs_to_string_yaml
     string = ''
     n_arr, n_cpf, n_name, n_state, n_value = get_name_length

     apply_config(n_arr, n_cpf, n_name, n_state, n_value, string)

     return string
  end

  private

  def apply_config(n_arr, n_cpf, n_name, n_state, n_value, string)
    (0..@data.length - 1).each { |i|
      (0..@data[0].length - 1).each { |j|
        if @data[i].to_a[j][1].length < n_arr[j]
          if @config['name']['align'] = 'left'
            @data[i][:name] = @data[i][:name].ljust(n_arr[j], " ") if (@config.fetch('name', {})['padding'] == 'spaces')
            @data[i][:name] = @data[i][:name].ljust(n_arr[j], "0") if (@config.fetch('name', {})['padding'] == 'zeroes')
          else
            @data[i][:name] = @data[i][:name].rjust(n_arr[j], " ") if (@config.fetch('name', {})['padding'] == 'spaces')
            @data[i][:name] = @data[i][:name].rjust(n_arr[j], "0") if (@config.fetch('name', {})['padding'] == 'zeroes')
          end

          if @config['cpf']['align'] = "left"
            @data[i][:cpf] = @data[i][:cpf].ljust(n_arr[j], " ") if (@config.fetch('name', {})['padding'] == 'spaces')
            @data[i][:cpf] = @data[i][:cpf].ljust(n_arr[j], "0") if (@config.fetch('name', {})['padding'] == 'zeroes')
          else
            @data[i][:cpf] = @data[i][:cpf].rjust(n_arr[j], " ") if (@config.fetch('name', {})['padding'] == 'spaces')
            @data[i][:cpf] = @data[i][:cpf].rjust(n_arr[j], "0") if (@config.fetch('name', {})['padding'] == 'zeroes')
          end

          if @config['state']['align'] = 'left'
            @data[i][:state] = @data[i][:state].ljust(n_arr[j], " ") if (@config.fetch('name', {})['padding'] == 'spaces')
            @data[i][:state] = @data[i][:state].ljust(n_arr[j], "0") if (@config.fetch('name', {})['padding'] == 'zeroes')
          else
            @data[i][:state] = @data[i][:state].rjust(n_arr[j], " ") if (@config.fetch('name', {})['padding'] == 'spaces')
            @data[i][:state] = @data[i][:state].rjust(n_arr[j], "0") if (@config.fetch('name', {})['padding'] == 'zeroes')
          end

          if @config['value']['align'] = 'left'
            @data[i][:value] = @data[i][:value].ljust(n_arr[j], " ") if (@config.fetch('name', {})['padding'] == 'spaces')
            @data[i][:value] = @data[i][:value].ljust(n_arr[j], "0") if (@config.fetch('name', {})['padding'] == 'zeroes')
          else
            @data[i][:value] = @data[i][:value].rjust(n_arr[j], " ") if (@config.fetch('name', {})['padding'] == 'spaces')
            @data[i][:value] = @data[i][:value].rjust(n_arr[j], "0") if (@config.fetch('name', {})['padding'] == 'zeroes')
          end
        end }

      write_strings(i, n_cpf, n_name, n_state, n_value, string)
    }
  end

  def write_strings(i, n_cpf, n_name, n_state, n_value, string)
    string << @data[i][:name][0..n_name - 1] + @data[i][:cpf][0..n_cpf - 1] + @data[i][:state][0..n_state - 1] + @data[i][:value][0..n_value - 1]

    if i != (@data.length - 1)
      string << "\n"
    end
  end

  def get_name_length
    n_name = @config.fetch('name', {})['length'] || -100
    n_cpf = @config.fetch('cpf', {})['length'] || -100
    n_state = @config.fetch('state', {})['length'] || -100
    n_value = @config.fetch('value', {})['length'] || -100
    n_arr = [n_name, n_cpf, n_state, n_value]

    return n_arr, n_cpf, n_name, n_state, n_value
  end
end

input =
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

# config_file_path = 'exemplo1.yaml'
#
# teste = TesteTecnico.new(input, config_file_path)
# p teste.hashs_to_string_yaml