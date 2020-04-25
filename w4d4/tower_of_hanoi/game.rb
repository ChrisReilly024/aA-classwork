require "tower"
require "rspec"

describe "Tower" do
    subject(:tower) { Tower.new } 
    
    describe "#initialize" do
        it "creates an instance of Tower" do
            expect(tower).to be_an_instance_of(Tower)
        end

        it "should create three towers" do 
            expect(tower.board).to eq([[], [], []]) 
        end

    end

    describe "#place_disks" do
        it "populate first array with three disks of different size" do
            expect(tower.place_disks).to eq([[1, 2, 3], [], []])
        end
    end

    describe "#get_turn" do 
        it "should retrieve start position from player" do
            
        end
    end

    describe "#move" do

        context "should take a disk" do
            it "should take in two numbers as an arg" do
                expect {tower.move(1, 2)}.not_to raise_error
            end

            tower = Tower.new 
            tower.place_disks

            it "can only take from the top of a tower and move to the next" do
                expect(tower.move(0,1)).to eq([[2,3], [1], []])
            end
        end
            
        context "should raise and error if taken disk is bigger than target position disk" do
            it "should not let user move a bigger disk on top of a smaller disk" do
                #expect{tower.move(0,1)}.to raise_error(RuntimeError)
            end
        end
    end

    describe "#won?" do
        let(:tower) { double("tower", :won? => true) }
        
        context "if game has been won" do
            it "should return true if the game has been won" do
                expect(tower.won?).to be true
            end
        end

        let(:tower_2) { double("tower_2", :won? => false)}

        context "if game has not been won" do
            it "should return false if game has not been won" do
                expect(tower_2.won?).to be false
            end
        end
    end
end

# require 'rspec'
# require 'dog.rb'

# describe Dog do # Class 
#     # describe what the Dog class should do 

#     # subject should be in outer scope so all tests have access to it 
#     subject(:fido) { Dog.new("Fido") }
    
#     describe "#initialize" do  
#         it "creates an instance of the Dog class" do 
#             expect(fido).to be_an_instance_of(Dog)
#         end 

#         it "sets the name" do  
#             expect(fido.name).to eq("Fido")
#         end 
#     end 
#     # every method should have its own describe block
#     describe "#name=" do 
#         it "should reassign name" do 
#             # execute logic 
#             fido.name = "Danny" 
#             # check expectation
#             expect(fido.name).to eq("Danny") 
#         end 
#     end 

#     describe "#encounter_cat" do 
#     # simulate the expected functionality for the double 
#         let(:friendly_cat) { double("Cat", { friendly?: true } )}
#         let(:mean_cat) { double("Cat", { friendly?: false } )}

#         # scenario 1: meet friendly cat
#         context "meets a friendly cat" do 
#             # it "plays" do 
#             #     # two helper private methods: play and run_away that should be invoked if cat is friendly 
#             #     expect(fido).to receive(:play)
#             #     # execute logic 
#             #     fido.encounter_cat(friendly_cat)
#             # end 

#             it "raise an error" do 
#                 expect { fido.encounter_cat(friendly_cat) }.to raise_error(FriendlyCatError)
#             end 
#         end 
#         # scenario 2: meet mean cat 
#         context "meets a mean cat" do 
#             it "runs away" do 
#                 expect(fido).to receive(:run_away)
#                 fido.encounter_cat(mean_cat)
#             end 
#         end 
#     end 
# end 

https://github.com/eric-2311/W4D4