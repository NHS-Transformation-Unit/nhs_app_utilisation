
# Sub ICB Reference -------------------------------------------------------

sub_icb_lookup_red <- sub_icb_lookup |>
  select(c(SICBL24CDH, ICB24CDH))

# 13+ Populations by ICB --------------------------------------------------

gp_reg <- rbind(gp_reg_female, gp_reg_male)

gp_reg_13 <- gp_reg |>
  filter(AGE != "ALL") |>
  group_by(SUB_ICB_LOCATION_CODE, SEX, AGE) |>
  summarise(NUMBER_OF_PATIENTS = sum(NUMBER_OF_PATIENTS, na.rm = TRUE)) |>
  mutate(AGE = case_when(AGE == "95+" ~ 95,
                         TRUE ~ as.numeric(AGE))) |>
  filter(AGE >= 13) |>
  left_join(sub_icb_lookup_red, by = c("SUB_ICB_LOCATION_CODE" = "SICBL24CDH"))

icb_reg_13 <- gp_reg_13 |>
  group_by(ICB24CDH) |>
  summarise(NUMBER_OF_PATIENTS = sum(NUMBER_OF_PATIENTS, na.rm = TRUE))


# ONS England Mid Year Estimates ------------------------------------------

ons_eng_2023 <- ons_my_pop_2023 |>
  filter(`Area name` == "ENGLAND",
         Year == 2023) |>
  gather(Age, Pop, -c(1:4)) |>
  mutate(Age_Num = case_when(Age == "90+" ~ 90,
                             TRUE ~ as.numeric(Age)),
         Age_Band = case_when(Age_Num < 13 ~ "12 and under",
                              Age_Num < 15 ~ "13 to 14",
                              Age_Num < 20 ~ "15 to 19",
                              Age_Num < 25 ~ "20 to 24",
                              Age_Num < 30 ~ "25 to 29",
                              Age_Num < 35 ~ "30 to 34",
                              Age_Num < 40 ~ "35 to 39",
                              Age_Num < 45 ~ "40 to 44",
                              Age_Num < 50 ~ "45 to 49",
                              Age_Num < 55 ~ "50 to 54",
                              Age_Num < 60 ~ "55 to 59",
                              Age_Num < 65 ~ "60 to 64",
                              Age_Num < 70 ~ "65 to 69",
                              Age_Num < 75 ~ "70 to 74",
                              Age_Num < 80 ~ "75 to 79",
                              Age_Num < 85 ~ "80 to 84",
                              Age_Num < 90 ~ "85 to 89",
                              Age_Num < 95 ~ "90+",
                              TRUE ~ NA
                              )
         )

ons_eng_age_band <- ons_eng_2023 |>
  group_by(Age_Band) |>
  summarise(Pop = sum(Pop, na.rm = TRUE))
