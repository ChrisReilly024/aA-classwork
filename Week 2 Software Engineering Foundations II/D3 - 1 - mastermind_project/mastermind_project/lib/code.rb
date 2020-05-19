class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(char)
    char.all? {|peg| POSSIBLE_PEGS.has_key?(peg.upcase)}
  end
end
