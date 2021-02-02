# load packages -----------------------------------------------------------

library(tidyverse)

# firefly graph making ----------------------------------------------------

firefly_data <- read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q19FireflySpermatophoreMass.csv")

firefly_data

ggplot(data = firefly_data)

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass))

ggplot(data = firefly_data) +
  geom_histogram(mapping = aes(x = spermatophoreMass),
                 boundary = 0, closed = "left", 
                 fill = "#C5351B", color = "black") +
  labs(x = "Spermatophore mass", y = "Frequency (number of eggs)") +
  scale_y_continuous(breaks = seq(0, 10, 1), limits = c(0, 10), 
                     expand = expansion(mult = 0)) +
  scale_x_continuous(breaks = seq(0, .20, .05)) +
  theme_classic() +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1))
  )

mode(firefly_data)

# Bird orders data --------------------------------------------------------

library(auk)                          # load the auk package
birds <- ebird_taxonomy %>%           # start with the ebird_taxonomy data
  as_tibble() %>%                     # tibbles print better in the console
  filter(category == "species")       # remove non-species taxa

birds

distinct(birds, family_common)

count(birds, family_common)

ggplot(data = birds)

ggplot(data = birds) +
  geom_bar(mapping = aes(x = order))

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)))

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B")

ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#C5351B", 
           width = .8) +
  labs(x = "Order", y = "Frequency (log number of bird species)", 
       title = "Number of bird species in each order", 
       subtitle = "*numbers are in log scale to better show data.") +
  scale_y_log10() +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1)),
    axis.text.x = element_text(angle = 60, hjust = 1),
    axis.ticks.x = element_blank()
  )
