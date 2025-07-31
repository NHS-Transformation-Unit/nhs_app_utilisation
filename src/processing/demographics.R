
# Age Demographics --------------------------------------------------------

app_demo_age <- app_demo_age_raw |>
  mutate(AgeBand = case_when(AgeGroup == "Unknown" ~ "Unknown",
                             AgeGroup %in% c("90 to 94", "95 to 99", "100+") ~ "90+",
                             TRUE ~ AgeGroup)
  ) |>
  filter(AgeBand != "Unknown") |>
  group_by(YearMonth, AgeBand) |>
  summarise(Logins = sum(Logins, na.rm = TRUE),
            Unique_Logins = sum(Unique_Logins, na.rm = TRUE)) |>
  left_join(ons_eng_age_band, by = c("AgeBand" = "Age_Band")) |>
  rowwise() |>
  mutate(rate = Unique_Logins / Pop,
         rate_per_1000 = rate * 1000,
         ci = list(binom.confint(Unique_Logins, Pop, method = "wilson"))
  ) |>
  unnest_wider(ci) |>
  rename(lower_ci = lower,
         upper_ci = upper) |>
  mutate(lower_ci_per_1000 = lower_ci * 1000,
         upper_ci_per_1000 = upper_ci * 1000)


# Age Demographics - Outpatient Proxy -------------------------------------

app_demo_age_op <- app_demo_age_raw |>
  mutate(AgeBand = case_when(AgeGroup == "Unknown" ~ "Unknown",
                             AgeGroup %in% c("90 to 94", "95 to 99", "100+") ~ "90+",
                             TRUE ~ AgeGroup)) |>
  filter(AgeBand != "Unknown") |>
  group_by(YearMonth, AgeBand) |>
  summarise(Logins = sum(Logins, na.rm = TRUE),
            Unique_Logins = sum(Unique_Logins, na.rm = TRUE)) |>
  inner_join(op_age_activity, by = c("AgeBand")) |>
  group_by(YearMonth) |>
  mutate(UU_Prop = Unique_Logins / sum(Unique_Logins),
         OP_Prop = Total_OP / sum(Total_OP),
         ratio = UU_Prop / OP_Prop,
         se_log_ratio = sqrt((1 / Unique_Logins) - (1 / sum(Unique_Logins)) + (1 / Total_OP) - (1 / sum(Total_OP))),
         log_ratio = log(ratio),
         lower_ci = exp(log_ratio - (1.96 * se_log_ratio)),
         upper_ci = exp(log_ratio + (1.96 * se_log_ratio)))

app_demo_age_op_logins <- app_demo_age_raw |>
  mutate(AgeBand = case_when(AgeGroup == "Unknown" ~ "Unknown",
                             AgeGroup %in% c("90 to 94", "95 to 99", "100+") ~ "90+",
                             TRUE ~ AgeGroup)) |>
  filter(AgeBand != "Unknown") |>
  group_by(YearMonth, AgeBand) |>
  summarise(Logins = sum(Logins, na.rm = TRUE),
            Unique_Logins = sum(Unique_Logins, na.rm = TRUE)) |>
  inner_join(op_age_activity, by = c("AgeBand")) |>
  group_by(YearMonth) |>
  mutate(L_Prop = Logins / sum(Logins),
         OP_Prop = Total_OP / sum(Total_OP),
         ratio = L_Prop / OP_Prop,
         se_log_ratio = sqrt((1 / Logins) - (1 / sum(Logins)) + (1 / Total_OP) - (1 / sum(Total_OP))),
         log_ratio = log(ratio),
         lower_ci = exp(log_ratio - (1.96 * se_log_ratio)),
         upper_ci = exp(log_ratio + (1.96 * se_log_ratio)))       


# Deprivation -------------------------------------------------------------

app_demo_dep <- app_demo_imd_raw |>
  mutate(IMD_Decile = as.numeric(IMD_Decile)) |>
  inner_join(imd_pop, by = c("IMD_Decile" = "Deprivation Decile (IMD 2020)")) |>
  rowwise() |>
  mutate(rate = Unique_Logins / Pop,
         rate_per_1000 = rate * 1000,
         ci = list(binom.confint(Unique_Logins, Pop, method = "wilson"))
  ) |>
  unnest_wider(ci) |>
  rename(lower_ci = lower,
         upper_ci = upper) |>
  mutate(lower_ci_per_1000 = lower_ci * 1000,
         upper_ci_per_1000 = upper_ci * 1000)
