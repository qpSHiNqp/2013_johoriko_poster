require "./cube"

c = Cube.new
orig = Cube.new
seq = [T,H,E,U,N,I,V,E,R,S,I,T,Y,O,F,T,O,K,Y,O]

repeat = 0
begin
    repeat += 1
    pp "rotation trial ##{repeat}"
    seq.each do |i|
        c.rotateByAlphabet i
    end
    pp "rotation finished"
end until orig.geo == c.geo

pp "!!!!!!!!"

pp repeat
