
# Load MI Data ------------------------------------------------------------

mi_raw <- read_excel(paste0(here("data",
                                 "mi_raw",
                                 "NHS App Management Information Statistics - June 2025.xlsx")),
                     sheet = "Table 2",
                     skip = 2,
                     n_max = 172)


# Load GP Registered Populations ------------------------------------------

gp_reg_male <- read.csv(paste0(here("data",
                                    "reference",
                                    "gp-reg-pat-prac-sing-age-male.csv")))

gp_reg_female <- read.csv(paste0(here("data",
                                      "reference",
                                      "gp-reg-pat-prac-sing-age-female.csv")))


# Load Sub-ICB Lookup -----------------------------------------------------

sub_icb_lookup <- read.csv(paste0(here("data",
                                       "reference",
                                       "Sub_ICB_Locations_to_Integrated_Care_Boards_to_NHS_England_(Region)_(2024)_Lookup_in_EN.csv")))


# Load ONS Mid Year Population Estimates ----------------------------------

ons_my_pop_2023 <- read_excel(paste0(here("data",
                                          "reference",
                                          "ons_my_pop_estimates_2023.xlsx")),
                              skip = 6)

# Load App Demographics ---------------------------------------------------

app_demo_age_raw <- read_excel(paste0(here("data",
                                           "foi_received_raw",
                                           "FOI-2507-2241508 - NHS App User Demographics.xlsx")),
                               sheet = "1. By ageband",
                               skip = 1,
                               n_max = 60)

app_demo_imd_raw <- read_excel(paste0(here("data",
                                           "foi_received_raw",
                                           "FOI-2507-2241508 - NHS App User Demographics.xlsx")),
                               sheet = "2. By IMD decile",
                               skip = 1,
                               n_max = 33)

# Load OP Age Data --------------------------------------------------------

op_age_2324 <- read_excel(paste0(here("data",
                                      "reference",
                                      "hosp-epis-stat-outp-rep-tabs-2023-24-tab (1).xlsx")),
                          sheet = "Summary Report 3",
                          skip = 5,
                          n_max = 20)
