FactoryBot.define do
  factory :attachment do
    after :create do |b|
      b.update_column(:images, "foo/bar/baz.png")
    end
  end
end
