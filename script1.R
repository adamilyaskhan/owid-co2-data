library(readxl)
#install.packages("ggplot2")
library(ggplot2)
library(readxl)
library(plotly)

carbon_data <- read_excel("c02 data/owid-co2-data (1).xlsx")

data_2018 <- subset(owid_co2_data_1_, year ==2018)

bp<- ggplot(data_2018, aes(x="", y=co2, fill=country))+
  geom_bar(width = 1, stat = "identity")
bp


data_main_groups <- subset(owid_co2_data_1_, country == "Asia (excl. China & India)" | 
                             country == "China" | country == "India" | country == "Europe" | country == "North America (excl. USA)" |
  country == "United States" | country == "South America" | country == "Africa" | country == "Oceania" )


main_groups_plot_percap <- ggplot(data_main_groups, aes(x=year, y=co2_per_capita, group=country, col=country, fill=country)) + geom_point() +
  geom_line() + labs(x="Year", y="Tonnes of CO2 per capita") +theme_minimal()

main_groups_plot_percap

main_groups_plot <- ggplot(data_main_groups, aes(x=year, y=co2, group=country, col=country, fill=country)) + geom_point() +
  geom_line() + labs(x="Year", y="Tonnes of CO2 per year") +theme_minimal()

main_groups_plot

main_groups_plot_cumul <- ggplot(data_main_groups, aes(x=year, y=cumulative_co2, group=country, col=country, fill=country)) + geom_point() +
  geom_line() + labs(x="Year", y="Cumulative tonnes of CO2") +theme_minimal()

main_groups_plot_cumul


data_2018_mg <- subset(data_main_groups, year ==2018)

bp<- ggplot(data_2018_mg, aes(x="", y=cumulative_co2, fill=country))+
  geom_bar(width = 1, stat = "identity")

library(plotly)
gplotly(bp)




owid_co2_data_1_ <- read_excel("owid-co2-data (1).xlsx")
View(carbon_data) 
uk_data <- subset(owid_co2_data_1_, iso_code == "GBR")
uk_co2_per_capita <- ggplot(uk_data, aes(x= year, y=co2_per_capita)) + geom_point(color="darkblue") +geom_line(color="darkblue") + ylim(min=0, max=12) + theme_linedraw() +labs(title= "UK", x="Year", y = "Tonnes of CO2 per capita")
uk_co2_cumulative <- ggplot(uk_data, aes(x= year, y=cumulative_co2)) + geom_point(color="darkblue") +geom_line(color="darkblue") + theme_linedraw() +labs(title= "UK", x="Year", y = "Cumulative tonnes of Co2 released")
uk_share_global_c02  <- ggplot(uk_data, aes(x= year, y=share_global_co2)) + geom_point(color="darkblue") +geom_line(color="darkblue") + theme_linedraw() +labs(title= "UK", x="Year", y = "% share of global Co2")
uk_co2_cumulative
uk_share_global_c02

uk_co2_per_capita
uk_co2_cumulative


usa_data <- subset(carbon_data, iso_code == "USA")
usa_co2_per_capita <- ggplot(usa_data, aes(x= year, y=co2_per_capita)) + geom_point(color="darkblue") +geom_line(color="darkblue") + ylim(min=0, max=25) + theme_linedraw() +labs(title= "USA", x="Year", y = "Tonnes of CO2 per capita")
usa_co2_cumulative <- ggplot(usa_data, aes(x= year, y=cumulative_co2)) + geom_point(color="darkblue") +geom_line(color="darkblue") + theme_linedraw() +labs(title= "USA", x="Year", y = "Cumulative tonnes of Co2 released")
usa_share_global_c02  <- ggplot(usa_data, aes(x= year, y=share_global_co2)) + geom_point(color="darkblue") +geom_line(color="darkblue") + theme_linedraw() +labs(title= "USA", x="Year", y = "% share of global Co2")
usa_co2_cumulative
usa_share_global_c02
usa_co2_per_capita

usa_uk_china_ind_data <- subset(carbon_data, iso_code =="USA" | iso_code =="GBR" | iso_code == "CHN" | iso_code =="IND")

uk_usa_china_ind_percap_plot <- ggplot(usa_uk_china_ind_data, aes(x=year, y=co2_per_capita, group=country, col=country, fill=country)) +
  geom_point() +
  geom_line() + labs(x="Year", y="Tonnes of CO2 per capita") +theme_minimal()

uk_usa_china_ind_percap_plot

uk_usa_china_ind_share_plot <- ggplot(usa_uk_china_ind_data, aes(x=year, y=share_global_co2, group=country, col=country, fill=country)) +
  geom_point() +
  geom_line() + labs(x="Year", y="% share of global CO2 emissions") +theme_minimal()

uk_usa_china_ind_share_plot


uk_usa_china_ind_cumul <- ggplot(usa_uk_china_ind_data, aes(x=year, y=cumulative_co2, group=country, col=country, fill=country)) +
  geom_point() +
  geom_line() + labs(x="Year", y="Cumulative tonnes of CO2 emissions") +theme_minimal()

uk_usa_china_ind_cumul

uk_usa_china_ind_cumul_share <- ggplot(usa_uk_china_ind_data, aes(x=year, y=share_global_cumulative_co2, group=country, col=country, fill=country)) +
  geom_point() +
  geom_line() + labs(x="Year", y="Share of global cumulative CO2 emissions") +theme_minimal()

uk_usa_china_ind_cumul_share





