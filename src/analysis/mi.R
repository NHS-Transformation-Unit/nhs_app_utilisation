
# Latest Month ------------------------------------------------------------

mi_latest <- mi |>
  filter(Month == max(mi$Month)) |>
  group_by(Month) |>
  summarise(NHS_App_Logins = sum(NHS_App_Logins, na.rm = TRUE),
            NHS_App_Unique_User_Logins = sum(NHS_App_Unique_User_Logins, na.rm = TRUE))

mi_icb_latest <- mi |>
  filter(Month == max(mi$Month))

ggplot(mi_icb_latest, aes(x = UU_Login_Rate, y = reorder(ICB_Name, -UU_Login_Rate),  fill = NHSE_Region_Name)) +
  geom_bar(stat = "identity") +
  scale_x_continuous(labels = percent)
