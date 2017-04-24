require 'json'

module FileReader
  def sentiword_to_json(filename)
    mappings = {}
    File.open(filename) do |file|
      file.each_line do |line|
        next if line[0] == '#'
        tokens = line.chomp.split("\t")
        pos_score = tokens[2].to_f
        neg_score = tokens[3].to_f
        synset = tokens[4]
        obj_score = 1 - (pos_score + neg_score)
        next if obj_score == 1

        if synset.match(/\s/)
          tmparr = synset.split
          tmparr.each { |w| mappings[w.gsub!(/#\d/, '')] = obj_score }
          next
        end
        mappings[synset.gsub!(/#\d/, '')] = obj_score
      end
    end

      file_output = File.open('en_words.json', 'w+')
      file_output.write(JSON.pretty_generate(mappings))
      file_output.close
  end

  def hash_from_json(filename)
    JSON.parse(File.read(filename))
  end
end

