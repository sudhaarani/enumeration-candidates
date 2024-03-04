# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here

# Call the method
puts experienced?(@candidates.[] 0)
puts find(7)
puts qualified_candidates(@candidates)
puts ordered_by_qualifications(@candidates)
pp @candidates