# poster_single_rotate.rb
# Author: Shintaro Tanaka
# test code to rotate by single alphabet
require "./cube"

c = Cube.new
seq = [T,H,E,U,N,I,V,E,R,S,I,T,Y,O,F,T,O,K,Y,O]

c.dump

case ARGV[0]
when "T"
    c.rotateByAlphabet T
when "H"
    c.rotateByAlphabet H
when "E"
    c.rotateByAlphabet E
when "U"
    c.rotateByAlphabet U
when "N"
    c.rotateByAlphabet N
when "I"
    c.rotateByAlphabet I
when "V"
    c.rotateByAlphabet V
when "R"
    c.rotateByAlphabet R
when "S"
    c.rotateByAlphabet S
when "Y"
    c.rotateByAlphabet Y
when "O"
    c.rotateByAlphabet O
when "F"
    c.rotateByAlphabet F
when "K"
    c.rotateByAlphabet K
end

c.dump
