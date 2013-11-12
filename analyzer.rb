# analyzer.rb
#Text Analyzer

#Getting data
lines = File.readlines(ARGV[0])
text = lines.join
sentences = text.gsub(/\s+/,' ').strip.split(/\.|\?|!/)
stop_words = %q{the a by on for of are with just but and to the my in I has some}
keyword_array = text.scan(/\w+/).select{ |word| !stop_words.include?(word) }
sentences_sorted = sentences.sort_by{ | sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1).select{ |sentence| sentence =~ /is|are/ }

#Calculations
line_count = lines.size
character_count = text.length
characters_nospace_count = text.gsub(/\s+/,'').length
word_count = text.split.length
sentence_count = sentences.length
paragraph_count = text.split(/\n\n/).length
keyword_count = keyword_array.length

#Display results
puts "#{line_count} lines"
puts "#{character_count} characters"
puts "#{characters_nospace_count} characters without whitespace"
puts "#{word_count} words"
puts "#{keyword_count} key words"
puts "#{((keyword_count.to_f / word_count.to_f) * 100).to_i} percent of words that are keywords"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "Ideal sentences:\n#{ideal_sentences.join(". \n")}"

#Staging area
puts "\n \n***Staging Area***"
# text = %q{
# Ruby is a great programming language.  It is object oriented
# and has many groovy features.  Some people don't like it, but that's
# not our problem!  It's easy to learn.  It's great.  To learn more about RUby,
# visit the official Ruby Web site today.
# }
# sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
# sentences_sorted = sentences.sort_by{ |sentence| sentence.length }
# one_third = sentences_sorted.length / 3
# ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
# ideal_sentences = ideal_sentences.select{ |sentence| sentence =~ /is|are/ }
# puts ideal_sentences.join(". ")