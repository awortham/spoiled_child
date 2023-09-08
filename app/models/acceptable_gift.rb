# require "dry/monads"
require "dry/monads/all"

class AcceptableGift
  include Dry::Monads[:result, :do]

  attr_reader :dog, :child, :existing_pet

  def initialize(dog, child)
    @dog = dog
    @child = child
    @existing_pet = child.dogs.first
  end

  def present_gift
    yield compare_cuteness_levels
    yield check_hair_length
    yield check_color
    yield check_can_fetch

    Success("I love this dog, thank you so much, you're the best dad in the whole world!!")
  end

  def compare_cuteness_levels
    levels = Dog.cuteness_levels

    if levels[dog.cuteness_level] <= levels[existing_pet.cuteness_level]
      Failure("Why do you hate me?? This isn't what I wanted!!")
    else
      Success()
    end
  end

  def check_hair_length
    if dog.long_haired?
      Failure("Why do you hate me?? This isn't what I wanted!!")
    else
      Success()
    end
  end

  def check_color
    if dog.color != "Brown with white spots"
      Failure("Why do you hate me?? This isn't what I wanted!!")
    else
      Success()
    end
  end

  def check_can_fetch
    if dog.can_fetch == false
      Failure("Why do you hate me?? This isn't what I wanted!!")
    else
      Success()
    end
  end
end
