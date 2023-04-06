
class TesteTecnico
=begin  def hashs_to_string(arg)
    string = ''
    n = 11

    (0..arg.length - 1).each { |i|

      (0..arg[0].length-1).each { |j|
        if arg[i].to_a[j][1].length < n
          arg[i][:name] = arg[i][:name].ljust(n," ")
          arg[i][:cpf] = arg[i][:cpf].ljust(n," ")
          arg[i][:state] = arg[i][:state].ljust(n," ")
          arg[i][:value] = arg[i][:value].ljust(n," ")
        end}

      string << arg[i][:name][0..n-1] + arg[i][:cpf][0..n-1] + arg[i][:state][0..n-1] + ' ' + arg[i][:value][0..n-1]

      if i != (arg.length - 1)
        string << "\n"
      end
    }
# "Maria Neusa97905796671Sao Paulo   1234       \nRicardo Fon44010762900Rio Grande  567        "
    return string
  end
=end
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

#teste = TesteTecnico.new
result = "Maria Neusa97905796671Sao Paulo   1234       \nRicardo Fon44010762900Rio Grande  567        "

if result = teste.hashs_to_string(input)
  p "foi powwww"
end

# Maria Neusa97905796671Sao Paulo   1234        \nRicardo Fon44010762900Rio Grande  567

