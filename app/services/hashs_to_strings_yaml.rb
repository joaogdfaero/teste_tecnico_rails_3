#!/usr/bin/env ruby
require 'yaml'
class TesteTecnico

  def hashs_to_string(arg)
     yaml_data = YAML.load_file('exemplo1.yaml')
    string = ''
    #n = 11

    # Como saber qual campo existe e qual não?

    n_cpf = yaml_data['cpf']['length']
    n_name = yaml_data['name']['length']
    n_value = yaml_data['cpf']['length']
     n_state = yaml_data['cpf']['state']

     puts arg

     (0..arg.length - 1).each { |i|
       string << arg[i][:name][0..yaml_data['name']['length']-1]
       }

     puts string



=begin
    (0..arg.length - 1).each { |i|

      (0..arg[0].length-1).each { |j|
        if arg[i].to_a[j][1].length < yaml_data['name']['length']
          arg[i][:name] = arg[i][:name].ljust(n," ")
        end}

      (0..arg[0].length-1).each { |j|
        if arg[i].to_a[j][1].length < yaml_data['cpf']['length']
          arg[i][:cpf] = arg[i][:cpf].ljust(n," ")
        end}

      (0..arg[0].length-1).each { |j|
        if arg[i].to_a[j][1].length < yaml_data['state']['length']
          arg[i][:state] = arg[i][:state].ljust(n," ")
        end}

      (0..arg[0].length-1).each { |j|
        if arg[i].to_a[j][1].length < yaml_data['value']['length']
          arg[i][:value] = arg[i][:value].ljust(n," ")
        end}

      string << arg[i][:name][0..yaml_data['name']['length']-1] + arg[i][:cpf][0..yaml_data['cpf']['length']-1] + arg[i][:state][0..yaml_data['state']['length']-1] + arg[i][:value][0..yaml_data['value']['length']-1]

      if i != (arg.length - 1)
        string << "\n"
      end
    }
    #return string
    p string

=end
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

teste = TesteTecnico.new
teste.hashs_to_string(input)