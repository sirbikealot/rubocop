# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::SubclassesMethod, :config do
  it 'registers an offense when using `.subclasses`' do
    expect_offense(<<~RUBY)
      MyClass.subclasses
      ^^^^^^^^^^^^^^^^^^ `.subclasses` is deprecated in favor of explicitly registering classes.
    RUBY
  end

  context 'when using safe navigation operator' do
    it 'registers an offense' do
      expect_offense(<<~RUBY)
        MyClass&.subclasses
        ^^^^^^^^^^^^^^^^^^^ `.subclasses` is deprecated in favor of explicitly registering classes.
      RUBY
    end
  end
end
