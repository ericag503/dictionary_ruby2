class Term

  attr_reader(:word, :definition)
  @@list = []

  def initialize(word)
    @word = word[:word]
    @definition = word[:definition]
  end

  def word_add
    @@list << self
  end

  def Term.all
    @@list
  end

  def edit_word(new_word)
    @word = new_word
  end

  def edit_def(new_def)
    @definition = new_def
  end

  def Term.search(input)
    result = ""
    @@list.each do |term|
      if term.word == input
       result = term.word + " : (def.) " + term.definition
      end
    end
    result
  end
end
