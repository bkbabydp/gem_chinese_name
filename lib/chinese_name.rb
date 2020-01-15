require 'chinese_name/version'
require 'chinese_name/const'

module ChineseName
  class Error < StandardError; end

  module_function

  def given_name
    random = rand(2)
    GIVEN_NAME.sample(random).join
  end

  def family_name
    count = FAMILY_NAME.length
    last_index = count - 1
    population = (0..last_index).to_a.map { |el| [el, 10**el] }
    return if population.empty?

    sum = (population[0][1] + population[last_index][1]) * count / 2
    random = rand(sum)
    index = population.reduce { |result, el| result[1] > random ? result : [el[0], result[1] + el[1]] }[0]
    FAMILY_NAME[index].split(' ').sample
  end
end
