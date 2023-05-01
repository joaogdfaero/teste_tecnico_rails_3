class TesteTecnico
  def hashs_to_string(arg)
    string = ''
    n = 11

    (0..arg.length - 1).each { |i|

      write_string(arg, i, n, string)
    }
    return string
  end

  private

  def write_string(arg, i, n, string)
    adjust_word(arg, i, n)

    string << arg[i][:name][0..n - 1] + arg[i][:cpf][0..n - 1] + arg[i][:state][0..n - 1] + arg[i][:value][0..n - 1]

    if i != (arg.length - 1)
      string << "\n"
    end
  end

  def adjust_word(arg, i, n)
    (0..arg[0].length - 1).each { |j|
      if arg[i].to_a[j][1].length < n
        arg[i][:name] = arg[i][:name].ljust(n, " ")
        arg[i][:cpf] = arg[i][:cpf].ljust(n, " ")
        arg[i][:state] = arg[i][:state].ljust(n, " ")
        arg[i][:value] = arg[i][:value].ljust(n, " ")
      end }
  end
end