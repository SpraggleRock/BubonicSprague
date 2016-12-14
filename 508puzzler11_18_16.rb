require 'csv'
write_up = []
15.times do
  citizens = (0..2).to_a
  round_count = 0
  while citizens.count > 1
    round_count += 1
    population = citizens.length
    to_go_home = []
    citizens.each do |citizen|
      until (a = citizens.sample) != citizen
        to_go_home << a
      end
    end
    citizens = citizens - to_go_home
  end
  write_up << ["#{round_count}", "#{citizens.count}"]
end

csv = ["Rounds", "Remaining"].to_csv
write_up.each do |line|
  csv += line.to_csv
end

File.open("results", "w+"){|f| f.write(csv)}





