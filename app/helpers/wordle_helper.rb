module WordleHelper
  def decorate_word(correct, guess)
    return "<span class='badge bg-danger'>#{guess}</span>".html_safe if guess.length < 5

    word = []
    chars = guess.chars
    chars.each_with_index do |letter, i|
      color = 'secondary'
      color = 'warning' if match_letter(correct, letter, i).negative?
      color = 'success' if match_letter(correct, letter, i).positive?
      word << "<span class='badge bg-#{color}'>#{letter}</span>"
    end
    word.join('-').html_safe
  end

  def match_letter(correct, letter, position)
    # -1 = position wrong, but letter right
    # 0 = no match at all
    # 1 = correct letter in position
    correct.downcase!
    letter.downcase!
    return 0 unless correct.chars.include? letter
    return 1 if correct.chars[position] == letter

    -1
  end
end
