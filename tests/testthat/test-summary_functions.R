test_that("'summary.ddt_lcm' returns a valid summary of DDT-LCM", {
  # load the result of fitting semi-synthetic data with 100 (for the sake of time) posterior samples
  data(result_diet)
  summarized_result <- summary(result_diet, burnin = 50, relabel = TRUE, be_quiet = TRUE)
  K <- result_diet$setting$K
  J <- length(unlist(result_diet$setting$item_membership_list))
  N <- nrow(result_diet$data)
  
  expect_length(summarized_result, 10)
  expect_s3_class(summarized_result, "summary.ddt_lcm")
  expect_s4_class(summarized_result$tree_map, "phylo4d")
  expect_equal(summarized_result$setting$K, K)
  expect_equal(nrow(summarized_result$response_probs_summary), K*J)

})
