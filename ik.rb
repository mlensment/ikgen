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
  puts "#{ik}#{ctrl}"
  exit
end

ctrl_sum = 0.0
ik.each_char.with_index do |char, i|
  ctrl_sum += char.to_i * multipliers_2[i]
end

ctrl = (ctrl_sum % 11).floor

puts "#{ik}0" if ctrl == 10
exit
puts "#{ik}#{ctrl}"
