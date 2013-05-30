require 'pp'

T,H,E,U,N,I,V,R,S, Y, O, F, K = 0,1,2,3,4,5,6,7,8,9,10,11,12

class Cube
    attr_reader :geo

    def initialize()
        @geo = Array.new

        @geo.push [
            ["I","p","w","g"],
            ["o",".",".","u"],
            ["a","c","t","o"],
            ["u","s","w","!"]
        ]
        @geo.push [
            [" ","u","i","l"],
            [" ","f","t"," "],
            ["s","c","y","s"],
            ["t","u","u","e"]
        ]
        @geo.push [
            ["o"," "," ","t"],
            ["S","-","t","o"],
            ["i","a","i"," "],
            ["n","n","n","."]
        ]
        @geo.push [
            ["h","w",":"," "],
            ["n","w","/","r"],
            ["o",".","o"," "],
            ["o","j","k","i"]
        ]
        @geo.push [
            ["a","k",".","y"],
            ["_","/","a","o"],
            ["_","t","t","l"],
            ["l","k","."," "]
        ]
        @geo.push [
            ["G","T","a","d"],
            ["h","/","s","e"],
            ["l","h"," ","r"],
            ["C","S","p","F"]
        ]
    end

#+----+
#|Ipwg|
#|o..u|EFHI KNOR
#|acto||||| ||||
#|usw!|VVVV VVVV
#+----+----+----+----+
#| uil|o  t|hw: |ak.y|->S
#| ft |S-to|nw/r|_/ao|->T
#|scys|iai |o.o |_ttl|->U
#|tuue|nnn.|ojki|lk. |->V,Y
#+----+----+----+----+
#|GTad|
#|h/se|
#|lh r|
#|CSpF|
#+----+
#
#Rotate this cube by repeating
#T,H,E,U,N,I,V,E,R,S,I,T,Y,O,F,T,O,K,Y,O
#201^^3 times.
#
#a^^b is up-arrow notation.

    def rotate(axis, pos)
        case axis
        when "x"
            tmp = @geo[0][3-pos]
            @geo[0][3-pos] = [
                @geo[4][3][3-pos],
                @geo[4][2][3-pos],
                @geo[4][1][3-pos],
                @geo[4][0][3-pos]
            ]
            @geo[4][0][3-pos], @geo[4][1][3-pos], @geo[4][2][3-pos], @geo[4][3][3-pos] = @geo[5][pos]
            @geo[5][pos] = [
                @geo[2][3][pos],
                @geo[2][2][pos],
                @geo[2][1][pos],
                @geo[2][0][pos]
            ]
            @geo[2][0][pos], @geo[2][1][pos], @geo[2][2][pos], @geo[2][3][pos] = tmp

            if pos == 0
                @geo[1][0][0], @geo[1][0][1], @geo[1][0][2], @geo[1][0][3],
                @geo[1][1][0], @geo[1][1][1], @geo[1][1][2], @geo[1][1][3],
                @geo[1][2][0], @geo[1][2][1], @geo[1][2][2], @geo[1][2][3],
                @geo[1][3][0], @geo[1][3][1], @geo[1][3][2], @geo[1][3][3] =
                @geo[1][3][0], @geo[1][2][0], @geo[1][1][0], @geo[1][0][0],
                @geo[1][3][1], @geo[1][2][1], @geo[1][1][1], @geo[1][0][1],
                @geo[1][3][2], @geo[1][2][2], @geo[1][1][2], @geo[1][0][2],
                @geo[1][3][3], @geo[1][2][3], @geo[1][1][3], @geo[1][0][3]
            elsif pos == 3
                @geo[3][0][0], @geo[3][0][1], @geo[3][0][2], @geo[3][0][3],
                @geo[3][1][0], @geo[3][1][1], @geo[3][1][2], @geo[3][1][3],
                @geo[3][2][0], @geo[3][2][1], @geo[3][2][2], @geo[3][2][3],
                @geo[3][3][0], @geo[3][3][1], @geo[3][3][2], @geo[3][3][3] =
                @geo[3][0][3], @geo[3][1][3], @geo[3][2][3], @geo[3][3][3],
                @geo[3][0][2], @geo[3][1][2], @geo[3][2][2], @geo[3][3][2],
                @geo[3][0][1], @geo[3][1][1], @geo[3][2][1], @geo[3][3][1],
                @geo[3][0][0], @geo[3][1][0], @geo[3][2][0], @geo[3][3][0]
            end

        when "y"
            tmp = [
                @geo[0][3][3-pos],
                @geo[0][2][3-pos],
                @geo[0][1][3-pos],
                @geo[0][0][3-pos]
            ]

            @geo[0][0][3-pos],
            @geo[0][1][3-pos],
            @geo[0][2][3-pos],
            @geo[0][3][3-pos] =
                @geo[1][0][3-pos],
                @geo[1][1][3-pos],
                @geo[1][2][3-pos],
                @geo[1][3][3-pos]

            @geo[1][0][3-pos],
            @geo[1][1][3-pos],
            @geo[1][2][3-pos],
            @geo[1][3][3-pos] =
                @geo[5][0][3-pos],
                @geo[5][1][3-pos],
                @geo[5][2][3-pos],
                @geo[5][3][3-pos]

            @geo[5][0][3-pos],
            @geo[5][1][3-pos],
            @geo[5][2][3-pos],
            @geo[5][3][3-pos] =
                @geo[3][3][pos],
                @geo[3][2][pos],
                @geo[3][1][pos],
                @geo[3][0][pos]

            @geo[3][0][pos],
            @geo[3][1][pos],
            @geo[3][2][pos],
            @geo[3][3][pos] = tmp

            if pos == 0
                @geo[2][0][0], @geo[2][0][1], @geo[2][0][2], @geo[2][0][3],
                @geo[2][1][0], @geo[2][1][1], @geo[2][1][2], @geo[2][1][3],
                @geo[2][2][0], @geo[2][2][1], @geo[2][2][2], @geo[2][2][3],
                @geo[2][3][0], @geo[2][3][1], @geo[2][3][2], @geo[2][3][3] =
                @geo[2][3][0], @geo[2][2][0], @geo[2][1][0], @geo[2][0][0],
                @geo[2][3][1], @geo[2][2][1], @geo[2][1][1], @geo[2][0][1],
                @geo[2][3][2], @geo[2][2][2], @geo[2][1][2], @geo[2][0][2],
                @geo[2][3][3], @geo[2][2][3], @geo[2][1][3], @geo[2][0][3]
            elsif pos == 3
                @geo[4][0][0], @geo[4][0][1], @geo[4][0][2], @geo[4][0][3],
                @geo[4][1][0], @geo[4][1][1], @geo[4][1][2], @geo[4][1][3],
                @geo[4][2][0], @geo[4][2][1], @geo[4][2][2], @geo[4][2][3],
                @geo[4][3][0], @geo[4][3][1], @geo[4][3][2], @geo[4][3][3] =
                @geo[4][0][3], @geo[4][1][3], @geo[4][2][3], @geo[4][3][3],
                @geo[4][0][2], @geo[4][1][2], @geo[4][2][2], @geo[4][3][2],
                @geo[4][0][1], @geo[4][1][1], @geo[4][2][1], @geo[4][3][1],
                @geo[4][0][0], @geo[4][1][0], @geo[4][2][0], @geo[4][3][0]
            end

        when "z"
            tmp = @geo[4][pos]
            @geo[4][pos] = @geo[3][pos]
            @geo[3][pos] = @geo[2][pos]
            @geo[2][pos] = @geo[1][pos]
            @geo[1][pos] = tmp

            if pos == 0
                @geo[0][0][0], @geo[0][0][1], @geo[0][0][2], @geo[0][0][3],
                @geo[0][1][0], @geo[0][1][1], @geo[0][1][2], @geo[0][1][3],
                @geo[0][2][0], @geo[0][2][1], @geo[0][2][2], @geo[0][2][3],
                @geo[0][3][0], @geo[0][3][1], @geo[0][3][2], @geo[0][3][3] =
                @geo[0][0][3], @geo[0][1][3], @geo[0][2][3], @geo[0][3][3],
                @geo[0][0][2], @geo[0][1][2], @geo[0][2][2], @geo[0][3][2],
                @geo[0][0][1], @geo[0][1][1], @geo[0][2][1], @geo[0][3][1],
                @geo[0][0][0], @geo[0][1][0], @geo[0][2][0], @geo[0][3][0]
            elsif pos == 3
                @geo[5][0][0], @geo[5][0][1], @geo[5][0][2], @geo[5][0][3],
                @geo[5][1][0], @geo[5][1][1], @geo[5][1][2], @geo[5][1][3],
                @geo[5][2][0], @geo[5][2][1], @geo[5][2][2], @geo[5][2][3],
                @geo[5][3][0], @geo[5][3][1], @geo[5][3][2], @geo[5][3][3] =
                @geo[5][3][0], @geo[5][2][0], @geo[5][1][0], @geo[5][0][0],
                @geo[5][3][1], @geo[5][2][1], @geo[5][1][1], @geo[5][0][1],
                @geo[5][3][2], @geo[5][2][2], @geo[5][1][2], @geo[5][0][2],
                @geo[5][3][3], @geo[5][2][3], @geo[5][1][3], @geo[5][0][3]
            end

        end
    end

    def rotateByAlphabet(a)
        case a
        when T
            self.rotate("z", 1)
        when H
            self.rotate("x", 2)
        when E
            self.rotate("x", 0)
        when U
            self.rotate("z", 2)
        when N
            self.rotate("y", 1)
        when I
            self.rotate("x", 3)
        when V
            self.rotate("z", 3)
        when R
            self.rotate("y", 3)
        when S
            self.rotate("z", 0)
        when Y
            self.rotate("z", 3)
        when O
            self.rotate("y", 2)
        when F
            self.rotate("x", 1)
        when K
            self.rotate("y", 0)
        end
    end

    def dump()
        pp "=== BEGIN ARRAY DUMP ==="
        print "+----+\n"
        @geo[0].each do |row|
            print "|"
            row.each do |cell|
                print cell
            end
            print "|\n"
        end
        print "+----+----+----+----+\n"
        for row in 0..3 do
            print "|"
            @geo[1][row].each do |cell|
                print cell
            end
            print "|"
            @geo[2][row].each do |cell|
                print cell
            end
            print "|"
            @geo[3][row].each do |cell|
                print cell
            end
            print "|"
            @geo[4][row].each do |cell|
                print cell
            end
            print "|\n"
        end
        print "+----+----+----+----+\n"
        @geo[5].each do |row|
            print "|"
            row.each do |cell|
                print cell
            end
            print "|\n"
        end
        print "+----+\n"
        pp "=== END ARRAY DUMP ==="
    end
end

