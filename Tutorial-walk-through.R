

# load packages -----------------------------------------------------------

library(tidyverse)


# Deaths from tigers ------------------------------------------------------

tiger_data <- read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e2aDeathsFromTigers.csv")
#> 
#> ── Column specification ────────────────────────────────────────────────────────
#> cols(
#>   person = col_double(),
#>   activity = col_character()
#> )
tiger_data
distinct(tiger_data, activity)
count(tiger_data, activity)
ggplot(data = tiger_data)

ggplot(data = tiger_data) +
  geom_bar(mapping = aes(x = activity))

ggplot(data = tiger_data) +
  geom_bar(mapping = aes(x = fct_infreq(activity)))

ggplot(data = tiger_data) +
  geom_bar(mapping = aes(x = fct_infreq(activity)), fill = "#C5351B")

ggplot(data = tiger_data) +
  geom_bar(mapping = aes(x = fct_infreq(activity)), fill = "#C5351B") +
  labs(x = "Activity", y = "Frequency (number of people)")

ggplot(data = tiger_data) +
  geom_bar(mapping = aes(x = fct_infreq(activity)), fill = "#C5351B", 
           width = .8) +
  labs(x = "Activity", y = "Frequency (number of people)") +
  scale_y_continuous(limits = c(0, 50), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.ticks.x = element_blank()
  )

# Bird abundances ---------------------------------------------------------

bird_data <- read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e2bDesertBirdAbundance.csv")
#> 
#> ── Column specification ────────────────────────────────────────────────────────
#> cols(
#>   species = col_character(),
#>   abundance = col_double()
#> )

bird_data                  # print the data in the console
#> # A tibble: 43 x 2
#>   species          abundance
#>   <chr>                <dbl>
#> 1 Black Vulture           64
#> 2 Turkey Vulture          23
#> 3 Harris's Hawk            3
#> 4 Red-tailed Hawk         16
#> 5 American Kestrel         7
#> 6 Gambel's Quail         148
#> # … with 37 more rows

ggplot(data = bird_data)

ggplot(data = bird_data) +
  geom_histogram(mapping = aes(x = abundance))
#> `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

ggplot(data = bird_data) +
  geom_histogram(mapping = aes(x = abundance), binwidth = 50)

ggplot(data = bird_data) +
  geom_histogram(mapping = aes(x = abundance), binwidth = 50,
                 boundary = 0, closed = "left")

ggplot(data = bird_data) +
  geom_histogram(mapping = aes(x = abundance), binwidth = 50,
                 boundary = 0, closed = "left")

ggplot(data = bird_data) +
  geom_histogram(mapping = aes(x = abundance), binwidth = 50,
                 boundary = 0, closed = "left", 
                 fill = "#C5351B", color = "black") +
  labs(x = "Abundance", y = "Frequency (number of species)") +
  scale_y_continuous(breaks = seq(0, 30, 5), limits = c(0, 30), 
                     expand = expansion(mult = 0)) +
  scale_x_continuous(breaks = seq(0, 600, 100)) +
  theme_classic() +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1))
  )
