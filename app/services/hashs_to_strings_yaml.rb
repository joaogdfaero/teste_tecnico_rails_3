#!/usr/bin/env ruby
require 'yaml'
class TesteTecnico
  def initialize(arg)
    @hashes = arg
    @yamlconfig = YAML.load_file('exemplo1.yaml')
  end

  # REFATORA O CÓDIGO COM AS SUGESTÕES DO CHATGPT
  def hashs_to_string
     string = ''

     n_name = @yamlconfig.fetch('name', {})['length'] || -100
     n_cpf = @yamlconfig.fetch('cpf', {})['length'] || -100
     n_state = @yamlconfig.fetch('state', {})['length'] || -100
     n_value = @yamlconfig.fetch('value', {})['length'] || -100
     n_arr = [n_name, n_cpf, n_state, n_value]

     (0..@hashes.length - 1).each { |i|

       (0..@hashes[0].length-1).each { |j|
         if @hashes[i].to_a[j][1].length < n_arr[j]
           if @yamlconfig.fetch('name', {})['align'] = 'left'
             @hashes[i][:name] = @hashes[i][:name].ljust(n_arr[j]," ") if (@yamlconfig.fetch('name', {})['padding'] == 'spaces')
             @hashes[i][:name] = @hashes[i][:name].ljust(n_arr[j],"0") if (@yamlconfig.fetch('name', {})['padding'] == 'zeroes')
           else
             @hashes[i][:name] = @hashes[i][:name].rjust(n_arr[j]," ") if (@yamlconfig.fetch('name', {})['padding'] == 'spaces')
             @hashes[i][:name] = @hashes[i][:name].rjust(n_arr[j],"0") if (@yamlconfig.fetch('name', {})['padding'] == 'zeroes')
           end

           if @yamlconfig.fetch('cpf', {})['align'] = "left"
             @hashes[i][:cpf] = @hashes[i][:cpf].ljust(n_arr[j]," ") if (@yamlconfig.fetch('name', {})['padding'] == 'spaces')
             @hashes[i][:cpf] = @hashes[i][:cpf].ljust(n_arr[j],"0") if (@yamlconfig.fetch('name', {})['padding'] == 'zeroes')
           else
             @hashes[i][:cpf] = @hashes[i][:cpf].rjust(n_arr[j]," ") if (@yamlconfig.fetch('name', {})['padding'] == 'spaces')
             @hashes[i][:cpf] = @hashes[i][:cpf].rjust(n_arr[j],"0") if (@yamlconfig.fetch('name', {})['padding'] == 'zeroes')
           end

           if @yamlconfig.fetch('state', {})['align'] = "left"
             @hashes[i][:state] = @hashes[i][:state].ljust(n_arr[j]," ") if (@yamlconfig.fetch('name', {})['padding'] == 'spaces')
             @hashes[i][:state] = @hashes[i][:state].ljust(n_arr[j],"0") if (@yamlconfig.fetch('name', {})['padding'] == 'zeroes')
           else
             @hashes[i][:state] = @hashes[i][:state].rjust(n_arr[j]," ") if (@yamlconfig.fetch('name', {})['padding'] == 'spaces')
             @hashes[i][:state] = @hashes[i][:state].rjust(n_arr[j],"0") if (@yamlconfig.fetch('name', {})['padding'] == 'zeroes')
           end

           if @yamlconfig.fetch('value', {})['align'] = "left"
             @hashes[i][:value] = @hashes[i][:value].ljust(n_arr[j]," ") if (@yamlconfig.fetch('name', {})['padding'] == 'spaces')
             @hashes[i][:value] = @hashes[i][:value].ljust(n_arr[j],"0") if (@yamlconfig.fetch('name', {})['padding'] == 'zeroes')
           else
             @hashes[i][:value] = @hashes[i][:value].rjust(n_arr[j]," ") if (@yamlconfig.fetch('name', {})['padding'] == 'spaces')
             @hashes[i][:value] = @hashes[i][:value].rjust(n_arr[j],"0") if (@yamlconfig.fetch('name', {})['padding'] == 'zeroes')
           end
         end}

       string << @hashes[i][:name][0..n_name-1] + @hashes[i][:cpf][0..n_cpf-1] + @hashes[i][:state][0..n_state-1] + @hashes[i][:value][0..n_value-1]

       if i != (@hashes.length - 1)
         string << "\n"
       end
       }

     p string
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

teste = TesteTecnico.new(input)
teste.hashs_to_string