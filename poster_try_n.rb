# poster_try_n.rb
# Author: Shintaro Tanaka
# try rotate according to the sequence N times.
require "./cube"

c = Cube.new
seq = [T,H,E,U,N,I,V,E,R,S,I,T,Y,O,F,T,O,K,Y,O]
repeat = ARGV[0].to_i
pp "repeat count: #{repeat}"

c.dump

# rotation
(seq * repeat).each do |i|
    c.rotateByAlphabet i
end

c.dump
