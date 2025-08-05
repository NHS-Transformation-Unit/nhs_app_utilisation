
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

# Create totals for IMD ---------------------------------------------------

op_dep_activity <- op_dep_2324 |>
  mutate(IMD_Decile = c(1:10)) |>
  select(c(7, 2))
         