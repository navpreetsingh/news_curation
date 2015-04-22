class Tht
  class << self
    def task(number)
      content = "lets meet at five"
      content = content.gsub(" ","")
      length = content.length - 1
      hash = {}
      num = number - 1      
      (0..num).each{|n| hash["array#{n}"] = ""}      
      (0..length).step(num).each_with_index do |pos, index|
        (0..num-1).each {|down| hash["array#{down}"] += content[down + pos] unless (down + pos) > length } if index.even?
        (1..num).to_a.reverse.each_with_index {|up,ind| hash["array#{up}"] += content[pos + ind] unless up + pos > length} unless index.even?              
      end
      new_content = ""
      (0..num).each{|n| new_content += hash["array#{n}"] }      
      puts new_content
    end
  
  end
end