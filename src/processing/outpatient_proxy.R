
# Create totals for age groups --------------------------------------------

op_age_activity <- op_age_2324 |>
  rowwise() |>
  mutate(Total_OP = sum(c_across(2:6)),
         Total_OP_ex_mat = sum(c_across(3:6))) |>
  mutate(AgeBand = if_else(
    str_detect(`Age (yrs)`, "-"),
    str_replace(`Age (yrs)`, "-", " to "),
    `Age (yrs)`
  )
  ) |>
  select(AgeBand, Total_OP, Total_OP_ex_mat)

         