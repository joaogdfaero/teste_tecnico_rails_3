require 'yaml'
class TesteTecnico
  def initialize(data, config_file_path)
    @data = data
    @config = YAML.load_file(config_file_path)
  end

  def strings_to_hashs
    n_arr, n_cpf, n_name, n_state, n_value = get_name_length

    cpf, name, value = get_field(n_cpf, n_name, n_value)
    cpf, name, value = remove_padding(cpf, name, value)

    return {cpf: cpf.strip, name: name.strip, value: value.strip}
  end

  private

  def remove_padding(cpf, name, value)
    if @config['cpf']['padding'] = 'zeroes' and @config['cpf']['align'] = 'left'
      cpf = cpf.sub(/\A0+/, '')
    elsif @config['cpf']['padding'] = 'zeroes' and @config['cpf']['align'] = 'right'
      cpf = cpf.sub(/0+$/, '')
    end

    if @config['name']['padding'] = 'zeroes' and @config['name']['align'] = 'left'
      name = name.sub(/\A0+/, '')
    elsif @config['name']['padding'] = 'zeroes' and @config['name']['align'] = 'right'
      name = name.sub(/0+$/, '')
    end

    if @config['value']['padding'] = 'zeroes' and @config['value']['align'] = 'left'
      value = value.sub(/\A0+/, '')
    elsif @config['value']['padding'] = 'zeroes' and @config['value']['align'] = 'right'
      value = value.sub(/0+$/, '')
    end
    return cpf, name, value
  end

  def get_field(n_cpf, n_name, n_value)
    cpf = @data[0..n_cpf - 1]
    name = @data[n_cpf..(n_cpf + n_name - 1)]
    value = @data[(n_cpf + n_name)..(n_cpf + n_name + n_value - 1)]
    return cpf, name, value
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

input = "97905796671Maria Neusa de    1234"
#input = "44010762900Ricardo Fontes00000567"

config_file_path = 'exemplo1.yaml'

teste = TesteTecnico.new(input, config_file_path)
p teste.strings_to_hashs