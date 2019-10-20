ARGF.each_line do |line|
  puts $1 if line=~/https:\/\/(dynamodb.+?)\//
end
