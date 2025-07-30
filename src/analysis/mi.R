
# Latest Month ------------------------------------------------------------

mi_latest <- mi |>
  filter(Month == max(mi$Month)) |>
  group_by(Month) |>
  summarise(NHS_App_Logins = sum(NHS_App_Logins, na.rm = TRUE),
            NHS_App_Unique_User_Logins = sum(NHS_App_Unique_User_Logins, na.rm = TRUE))

mi_icb_latest <- mi |>
  filter(Month == max(mi$Month)) |>
  rowwise() |>
  filter(ICB_Name != "Unknown") |>
  mutate(rate = NHS_App_Unique_User_Logins / Number_Patients_GP_Reg_13,
         rate_per_1000 = rate * 1000,
         ci = list(binom.confint(NHS_App_Unique_User_Logins, Number_Patients_GP_Reg_13, method = "wilson"))
  ) |>
  unnest_wider(ci) |>
  rename(lower_ci = lower,
         upper_ci = upper) |>
  mutate(lower_ci_per_1000 = lower_ci * 1000,
         upper_ci_per_1000 = upper_ci * 1000) |>
  mutate(ICB_Name_Chart = str_remove_all(ICB_Name, "NHS|Integrated Care Board") |>
           str_trim())

mi_icb_rates_latest_chart <- ggplot(mi_icb_latest, aes(x = rate_per_1000, y = reorder(ICB_Name_Chart, -rate_per_1000),  fill = NHSE_Region_Name)) +
  geom_bar(stat = "identity") +
  scale_x_continuous(breaks = seq(0, 250, 50)) +
  scale_fill_manual(values = palette_tu, name = "NHSE Region") +
  labs(x = "Rate of Unique Logins per 1,000 Population aged 13+ years",
       y = "ICB",
       title = "There is significant variation between ICBs in\nthe rate of unique logins to the NHS App",
       subtitle = "Rate of Unique Logins by ICB | June 2025",
       caption = "Source: NHS App Management Information") +
  theme(text = element_text(family = "Franklin Gothic Book"),
        strip.background = element_rect(fill = "#407EC9"),
        strip.text = element_text(colour = "#ffffff", size = 10),
        axis.text = element_text(size = 8),
        axis.text.y = element_text(size = 7),
        axis.title = element_text(size = 11),
        plot.title = element_text(size = 14, color = "#407EC9"),
        plot.subtitle = element_text(size = 12),
        panel.background = element_rect(fill = "#ffffff"),
        panel.grid.major.x = element_line(color = "#cecece", linewidth = 0.1),
        panel.grid.minor.x = element_blank(),
        axis.line = element_line(color = "#000000"),
        legend.position = "right",
        legend.text = element_text(size = 7.5)
  )


# Latest Month Comparisons ------------------------------------------------

mi_latest_comp <- mi_icb_latest |>
  filter(rate_per_1000 %in% c(min(mi_icb_latest$rate_per_1000), max(mi_icb_latest$rate_per_1000))) |>
  arrange(desc(rate_per_1000))
