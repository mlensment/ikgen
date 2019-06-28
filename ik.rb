module OS
  def OS.windows?
    return /win32/ =~RUBY_PLATFORM
  end
  def OS.mac?
    return /darwin/ =~ RUBY_PLATFORM
  end
  def OS.linux?
    return /linux/ =~ RUBY_PLATFORM
  end
end

def ending idcode
  puts idcode
  if ["-c", "--clipboard"].include? ARGV[0]
    if OS.windows?
      IO.popen('clip', 'w') { |f| f << idcode }
    elsif OS.mac?
      IO.popen('pbcopy', 'w') { |f| f << idcode }
    elsif OS.linux?
      IO.popen('xsel –clipboard –input', '2+') { |f| f << idcode }
    else
      puts "Clipboard not supported on your system"
      exit
    end
    puts "Copied to clipboard"
    exit
  end
end

gender = (3..4).to_a.sample
year = (50..99).to_a.sample.to_s.rjust(2, '0')
month = (1..12).to_a.sample.to_s.rjust(2, '0')
day = (1..30).to_a.sample.to_s.rjust(2, '0')
count = (1..999).to_a.sample.to_s.rjust(3, '0')

ik = "#{gender}#{year}#{month}#{day}#{count}"

multipliers_1 = [1,2,3,4,5,6,7,8,9,1]
multipliers_2 = [3,4,5,6,7,8,9,1,2,3]

ctrl_sum = 0.0
ik.each_char.with_index do |char, i|
  ctrl_sum += char.to_i * multipliers_1[i]
end

ctrl = (ctrl_sum % 11).floor

if ctrl != 10
  ending "#{ik}#{ctrl}"
end

ctrl_sum = 0.0
ik.each_char.with_index do |char, i|
  ctrl_sum += char.to_i * multipliers_2[i]
end

ctrl = (ctrl_sum % 11).floor

if ctrl == 10
  ending "#{ik}0"
end

ending "#{ik}#{ctrl}"
