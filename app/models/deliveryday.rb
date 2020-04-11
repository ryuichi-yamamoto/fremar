class Deliveryday < ActiveHash::Base

  self.data = [
    {id: 1, name: '１〜２日で発送'}, {id: 2, name: "３〜４日で発送"},
    {id: 3, name: '５〜７日で発送'}
]

end