require 'test_helper'

class ProblemsCreateTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid signup information" do
		get problem_path
		assert_no_difference 'Problem.count' do
		post problems_path, params:{problem: { titolo: "",
		linguaggio: "C",
		esercizio:
		"ewlkvlkernvlnvl",
		soluzione: "kcjno3jdnk3jn" }}
	end

	assert_template 'problems/new'
	end

	test "valid signup information" do
		get problem_path
		assert_difference 'Problem.count', 1 do
			post_via_redirect problems_path,params:{problem: { titolo: "efrf",
		linguaggio: "C",
		esercizio:
		"ewlkvlkernvlnvl",
		soluzione: "kcjno3jdnk3jn" }}
		end
		assert_template 'problems/show'
	end
end
