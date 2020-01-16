require 'chinese_name/version'
require 'chinese_name/const/family_name'
require 'chinese_name/const/given_name'

module ChineseName
  class Error < StandardError; end

  module_function

  # 加权随机；权数：2**(count - 1 - el)
  def sample_index1(count)
    last_index = count - 1
    population = (0..last_index).to_a.map { |el| [el, 2 << (last_index - el - 1)] }
    return if population.empty?

    sum = (population[0][1] + population[last_index][1]) * count >> 1
    random = rand(sum) + 1
    population.reduce { |result, el| result[1] > random ? result : [el[0], result[1] + el[1]] }[0]
  end

  def sample_index2(count)
    last_index = count - 1
    last_index.downto(0).to_a.sample
  end

  def sample_index(count)
    sample_index1(count)
  end

  def sample(collection)
    collection[sample_index(collection.length)]
  end

  def family_name
    # (sample(FAMILY_NAME) || '').split(' ').sample
    Const::FAMILY_NAME_2019.sample
  end

  def given_name
    random = rand(1..2)
    # Const::GIVEN_NAME.sample(random).map { |el| el.split(' ')[1] }.join
    Const::GIVEN_NAME_NORMAL.sample(random).join
  end

  def fullname
    "#{family_name}#{given_name}"
  end

  def dry
    result = {}
    1_000_000.times do
      i = sample_index(FAMILY_NAME.length)
      result[i] = (result[i] || 0) + 1
    end
    result
  end
end
