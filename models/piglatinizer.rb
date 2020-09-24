class PigLatinizer

  def piglatinize(sentence)
    words = self.split_words(sentence)
    piglatinized_words = words.collect do |word|
      piglatinize_word(word)
    end
    piglatinized_words.join(" ")
  end

  def piglatinize_word(word)

    root_word = ""
    added_part = ""
    if word[0].match?(/[aeiouAEIOU]/)
      word + "way"
    else
      word.each_char.with_index do |c, i|
        if c.match?(/[aeiouAEIOU]/)
          root_word = word[i..]
          added_part = word[0..i-1]
          break
        end
      end
      root_word + added_part + "ay"
    end
  end

  def split_words(sentence)
    sentence.split(" ")
  end
end
