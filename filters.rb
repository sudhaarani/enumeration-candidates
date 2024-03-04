# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

  def find(id)
    # Your code Here
    return @candidates.find { |candidate| candidate[:id] == id }
  end
  
  def experienced?(candidate)
    # Your code Here
    # puts candidate
    return candidate[:years_of_experience] > 2
  end
  
  def qualified_candidates(candidates)
    # Your code Here
    # Are experienced
    # Have 100 or more Github points
    # Know at least Ruby or Python
    # Applied in the last 15 days
    # Are over the age of 17 (18+)
    candidates.select do |element| #returns array that satisfies below conditions
      element[:years_of_experience] > 2 && element[:github_points] >=100 && element[:date_applied] && (Date.today - element[:date_applied]).to_i <= 15 && element[:age]>17 && (element[:languages].include?('Ruby') || element[:languages].include?('JavaScript'))
    end
  end


  # Candidates with the most experience are at the top
  # For Candidates that have the same years of experience, they are further sorted by their number of Github points (highest first)
  def ordered_by_qualifications(candidates)
    #we want descending order(high to low) so highest should come first in the array i.e index(-1), lowest should come last(i.e ::1) so here "a" goes to last and "b" comes first in array
    candidates.sort{|a,b| (a[:years_of_experience] == b[:years_of_experience]) ? ((a[:github_points] < b[:github_points]) ? 1 : -1) : ((a[:years_of_experience]<b[:years_of_experience]) ? 1 : -1)}
  end
  
  # More methods will go below
  # def ordered_by_qualifications(candidates)
  #   candidates.sort do |a, b|
  #     if a[:years_of_experience] == b[:years_of_experience]
  #       #sort by GitHub points (descending order)
  #       b[:github_points] <=> a[:github_points]
  #     else
  #       #sort by years of experience (descending order)
  #       b[:years_of_experience] <=> a[:years_of_experience]
  #     end
  #   end
  # end

=begin
# Combined comparison operator (returns `1` when the first argument is greater, 
# `-1` when the second argument is greater, and `0` otherwise)
1 <=> 10 #=> -1 (1 < 10)
10 <=> 1 #=> 1 (10 > 1)
1 <=> 1 #=> 0 (1 == 1)

If the block returns 0, it means that x and y are considered equal in terms of sorting. Their order relative to each other is not changed.

If the block returns -1, it means that x should come before y in the sorted array. This is essentially saying that x is "less than" y in the sorting order.

If the block returns 1, it means that x should come after y in the sorted array. This is saying that x is "greater than" y in the sorting order.
=end