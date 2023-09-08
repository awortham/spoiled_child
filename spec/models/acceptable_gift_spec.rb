require "rails_helper"

RSpec.describe AcceptableGift, type: :model do
  context "when new dog is less cute than existing dog" do
    it "returns an error" do
      spoiled_child = Child.create(name: "Sally")
      spoiled_child.dogs.create(cuteness_level: :very_cute)

      dog = Dog.create(
        cuteness_level: :cute,
        hair_length: :short_haired,
        color: "Brown with white spots",
        can_fetch: true
      )

      gift = AcceptableGift.new(dog, spoiled_child).present_gift

      expect(gift.success).to be_nil
      expect(gift.failure).to eq "Why do you hate me?? This isn't what I wanted!!"
    end
  end

  context "when new dog cannot fetch" do
    it "returns an error" do
      spoiled_child = Child.create(name: "Sally")
      spoiled_child.dogs.create(cuteness_level: :very_cute)

      dog = Dog.create(
        can_fetch: false,
        cuteness_level: :extremely_cute,
        color: "Brown with white spots",
        hair_length: :short_haired
      )

      gift = AcceptableGift.new(dog, spoiled_child).present_gift

      expect(gift.success).to be_nil
      expect(gift.failure).to eq "Why do you hate me?? This isn't what I wanted!!"
    end
  end

  context "when new dog everything the spoiled child ever wanted (until next week)" do
    it "returns an error" do
      spoiled_child = Child.create(name: "Sally")
      spoiled_child.dogs.create(cuteness_level: :very_cute)

      dog = Dog.create(
        can_fetch: true,
        cuteness_level: :extremely_cute,
        color: "Brown with white spots",
        hair_length: :short_haired
      )

      gift = AcceptableGift.new(dog, spoiled_child).present_gift

      expect(gift.success).to eq "I love this dog, thank you so much, you're the best dad in the whole world!!"
      expect(gift.failure).to be_nil
    end
  end
end
