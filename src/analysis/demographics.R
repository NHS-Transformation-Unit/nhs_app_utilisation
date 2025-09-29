
# Rate Chart --------------------------------------------------------------

app_demo_age_latest <- app_demo_age |>
  filter(YearMonth == max(app_demo_age$YearMonth))

demo_age_rates_chart <- ggplot(app_demo_age_latest, aes(y = AgeBand, x = rate_per_1000)) +
  geom_bar(stat = "identity", fill = palette_tu[2]) +
  geom_errorbar(aes(xmin = lower_ci_per_1000, xmax = upper_ci_per_1000)) +
  scale_x_continuous(breaks = seq(0, 350, 50)) +
  labs(x = "Rate of unique logins per 1,000 population",
       y = "Age Band",
       title = "There is wide variation in the unique login rates to the NHS\nApp across age groups",
       subtitle = "Unique login rates per 1,000 population | May 2025",
       caption = "Source: Login data from FOI request, Population estimates from ONS 2023 mid-year estimates") +
  theme(text = element_text(family = "Franklin Gothic Book"),
        strip.background = element_rect(fill = "#407EC9"),
        strip.text = element_text(colour = "#ffffff", size = 10),
        axis.text = element_text(size = 9),
        axis.title = element_text(size = 11),
        plot.title = element_text(size = 16, color = "#407EC9"),
        plot.subtitle = element_text(size = 12),
        panel.background = element_rect(fill = "#ffffff"),
        panel.grid.major.x = element_line(color = "#cecece", linewidth = 0.1),
        panel.grid.minor.x = element_blank(),
        axis.line = element_line(color = "#000000"),
        legend.position = "bottom",
        legend.text = element_text(size = 7.5)
  )


# Ratio Chart -------------------------------------------------------------

app_demo_age_op_latest <- app_demo_age_op |>
  filter(YearMonth == max(app_demo_age_op$YearMonth))

demo_age_op_ratio_chart <- ggplot(app_demo_age_op_latest, aes(x = ratio, y = AgeBand)) +
  geom_bar(stat = "identity", fill = palette_tu[1]) +
  geom_errorbar(aes(xmin = lower_ci, xmax = upper_ci), width = 0.6) +
  geom_vline(xintercept = 1) +
  scale_x_continuous(breaks = seq(0, 1.6, 0.2)) +
  labs(x = "Ratio of proprotion of Unique Logins to proportion of Outpatient Attendances (2023/24)",
       y = "Age Band",
       title = "NHS App usage is lower in older age groups compared with\ntheir utilisation of NHS Outpatient Services as a proxy\nof healthcare usage",
       subtitle = "Unique Logins for May 2025 compared with Outpatient attendances in 2023/24",
       caption = "Source: NHS Outpatient Attendances 2023/24 and NHS App Demographics FOI") +
  theme(text = element_text(family = "Franklin Gothic Book"),
        strip.background = element_rect(fill = "#407EC9"),
        strip.text = element_text(colour = "#ffffff", size = 10),
        axis.text = element_text(size = 8),
        axis.title = element_text(size = 11),
        plot.title = element_text(size = 16, color = "#407EC9"),
        plot.subtitle = element_text(size = 12),
        panel.background = element_rect(fill = "#ffffff"),
        panel.grid.major.x = element_line(color = "#cecece", linewidth = 0.1),
        panel.grid.minor.x = element_blank(),
        axis.line = element_line(color = "#000000"),
        legend.position = "bottom",
        legend.text = element_text(size = 7.5)
  )

app_demo_age_op_login_latest <- app_demo_age_op_logins |>
  filter(YearMonth == max(app_demo_age_op_logins$YearMonth))

demo_age_op_logins_ratio_chart <- ggplot(app_demo_age_op_login_latest, aes(x = ratio, y = AgeBand)) +
  geom_bar(stat = "identity", fill = palette_tu[5]) +
  geom_errorbar(aes(xmin = lower_ci, xmax = upper_ci), width = 0.6) +
  geom_vline(xintercept = 1) +
  scale_x_continuous(breaks = seq(0, 1.6, 0.2)) +
  labs(x = "Ratio of proprotion of Logins to proprotion of Outpatient Attendances (2023/24)",
       y = "Age Band",
       title = "NHS App usage is lower in older age groups compared with\ntheir utilisation of NHS Outpatient Services as a proxy\nof healthcare usage",
       subtitle = "Logins for May 2025 compared with Outpatient attendances in 2023/24",
       caption = "Source: NHS Outpatient Attendances 2023/24 and NHS App Demographics FOI") +
  theme(text = element_text(family = "Franklin Gothic Book"),
        strip.background = element_rect(fill = "#407EC9"),
        strip.text = element_text(colour = "#ffffff", size = 10),
        axis.text = element_text(size = 8),
        axis.title = element_text(size = 11),
        plot.title = element_text(size = 16, color = "#407EC9"),
        plot.subtitle = element_text(size = 12),
        panel.background = element_rect(fill = "#ffffff"),
        panel.grid.major.x = element_line(color = "#cecece", linewidth = 0.1),
        panel.grid.minor.x = element_blank(),
        axis.line = element_line(color = "#000000"),
        legend.position = "bottom",
        legend.text = element_text(size = 7.5)
  )


# Deprivation Rates -------------------------------------------------------

app_demo_dep_latest <- app_demo_dep |>
  filter(`Month-Year` == max(app_demo_dep$`Month-Year`)) |>
  mutate(IMD_Decile = factor(IMD_Decile, levels = c("1", "2", "3", "4", "5",
                                                    "6", "7", "8", "9", "10")))

demo_dep_rates_chart <- ggplot(app_demo_dep_latest, aes(y = IMD_Decile, x = rate_per_1000)) +
  geom_bar(stat = "identity", fill = palette_tu[2]) +
  geom_errorbar(aes(xmin = lower_ci_per_1000, xmax = upper_ci_per_1000)) +
  scale_x_continuous(breaks = seq(0, 350, 50)) +
  labs(x = "Rate of unique logins per 1,000 population",
       y = "IMD Decile (Based on GP Practice Location)",
       title = "There is less variation in the unique login rates to the NHS\nApp across IMD Deciles with higher rates in the more\ndeprived deciles",
       subtitle = "Unique login rates per 1,000 population | May 2025",
       caption = "Source: Login data from FOI request, Population estimates from ONS 2023 mid-year estimates") +
  theme(text = element_text(family = "Franklin Gothic Book"),
        strip.background = element_rect(fill = "#407EC9"),
        strip.text = element_text(colour = "#ffffff", size = 10),
        axis.text = element_text(size = 9),
        axis.title = element_text(size = 11),
        plot.title = element_text(size = 16, color = "#407EC9"),
        plot.subtitle = element_text(size = 12),
        panel.background = element_rect(fill = "#ffffff"),
        panel.grid.major.x = element_line(color = "#cecece", linewidth = 0.1),
        panel.grid.minor.x = element_blank(),
        axis.line = element_line(color = "#000000"),
        legend.position = "bottom",
        legend.text = element_text(size = 7.5)
  )

app_demo_dep_op_latest <- app_demo_dep_op |>
  filter(`Month-Year` == max(app_demo_dep$`Month-Year`)) |>
  mutate(IMD_Decile = factor(IMD_Decile, levels = c("1", "2", "3", "4", "5",
                                                    "6", "7", "8", "9", "10")))

demo_dep_op_ratio_chart <- ggplot(app_demo_dep_op_latest, aes(x = ratio, y = IMD_Decile)) +
  geom_bar(stat = "identity", fill = palette_tu[1]) +
  geom_errorbar(aes(xmin = lower_ci, xmax = upper_ci), width = 0.6) +
  geom_vline(xintercept = 1) +
  scale_x_continuous(breaks = seq(0, 1.2, 0.2)) +
  labs(x = "Ratio of proprotion of Unique Logins to proportion of Outpatient Attendances (2023/24)",
       y = "IMD Decile (App usage GP Location based)",
       title = "NHS App usage is lower in the more affluent areas compared with\ntheir utilisation of NHS Outpatient Services as a proxy\nof healthcare usage",
       subtitle = "Unique Logins for May 2025 compared with Outpatient attendances in 2023/24",
       caption = "Source: NHS Outpatient Attendances 2023/24 and NHS App Demographics FOI") +
  theme(text = element_text(family = "Franklin Gothic Book"),
        strip.background = element_rect(fill = "#407EC9"),
        strip.text = element_text(colour = "#ffffff", size = 10),
        axis.text = element_text(size = 8),
        axis.title = element_text(size = 11),
        plot.title = element_text(size = 16, color = "#407EC9"),
        plot.subtitle = element_text(size = 12),
        panel.background = element_rect(fill = "#ffffff"),
        panel.grid.major.x = element_line(color = "#cecece", linewidth = 0.1),
        panel.grid.minor.x = element_blank(),
        axis.line = element_line(color = "#000000"),
        legend.position = "bottom",
        legend.text = element_text(size = 7.5)
  )
