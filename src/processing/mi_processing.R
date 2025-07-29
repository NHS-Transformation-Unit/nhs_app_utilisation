
# Process and Clean MI Data -----------------------------------------------

mi <- mi_raw |>
  rename("ICB_ODS" = 2,
         "ICB_Name" = 3,
         "NHSE_Region_ODS" = 4,
         "NHSE_Region_Name" = 5,
         "NHS_App_Logins" = 6,
         "NHS_App_Unique_User_Logins" = 7) |>
  left_join(icb_reg_13, by = c("ICB_ODS" = "ICB24CDH")) |>
  rename("Number_Patients_GP_Reg_13" = 8) |>
  mutate("UU_Login_Rate" = NHS_App_Unique_User_Logins / Number_Patients_GP_Reg_13)
