usa_uk_eu27_china_ind_asia_data <- subset(carbon_data, country =="Asia (excl. China & India)" | country =="EU-27" | country == "China" | country=="India" | country =="United States" | country=="United Kingdom")

usa_uk_eu27_china_ind_asia_data_2018 <- subset(usa_uk_eu27_china_ind_asia_data, year==2018)

bp<- ggplot(usa_uk_eu27_china_ind_asia_data_2018, aes(x="", y=share_global_co2, fill=country))+
  geom_bar(width = 1, stat = "identity")
bp

p<-ggplot(usa_uk_eu27_china_ind_asia_data_2018, aes(x=country, y=share_global_co2)) +
  geom_bar(stat="identity", fill="darkblue", position = 'dodge') +  geom_text(aes(label=share_global_co2), position=position_dodge(width=0.9), vjust=-0.25) + theme(axis.text.x = element_text(angle = 90)) + labs(x="Country/region", y="% of global CO2 emissions in 2018") +ylim(min=0, max=30) 

p

p2<-ggplot(usa_uk_eu27_china_ind_asia_data_2018, aes(x=country, y=co2_per_capita)) +
  geom_bar(stat="identity", fill="darkblue", position = 'dodge') +  geom_text(aes(label=co2_per_capita), position=position_dodge(width=0.9), vjust=-0.25) + theme(axis.text.x = element_text(angle = 90)) + labs(x="Country/region", y= " Tonnes of CO2 per capita in 2018") +ylim(min=0, max=30) 

p2

usa_uk_eu27_china_ind_asia_percap <- ggplot(usa_uk_eu27_china_ind_asia_data, aes(x=year, y=co2_per_capita, group=country, col=country, fill=country)) +
  geom_point() +
  geom_line() + labs(x="Year", y="Tonnes of CO2 per capita") +theme_minimal()

usa_uk_eu27_china_ind_asia_percap


usa_uk_eu27_china_ind_asia_share <- ggplot(usa_uk_eu27_china_ind_asia_data, aes(x=year, y=share_global_co2, group=country, col=country, fill=country)) +
  geom_point() +
  geom_line() + labs(x="Year", y="Share of global CO2 emissions (%)") +theme_minimal()

usa_uk_eu27_china_ind_asia_share

usa_uk_eu27_china_ind_asia_cumul <- ggplot(usa_uk_eu27_china_ind_asia_data, aes(x=year, y=cumulative_co2, group=country, col=country, fill=country)) +
  geom_point() +
  geom_line() + labs(x="Year", y="Cumulative CO2 emissions (tonnes)") +theme_minimal()

usa_uk_eu27_china_ind_asia_cumul

usa_uk_eu27_china_ind_asia_cumul_share <- ggplot(usa_uk_eu27_china_ind_asia_data, aes(x=year, y=share_global_cumulative_co2, group=country, col=country, fill=country)) +
  geom_point() +
  geom_line() + labs(x="Year", y="Share of cumulative CO2 emissions (%)") +theme_minimal()

usa_uk_eu27_china_ind_asia_cumul_share

usa_uk_eu27_china_ind_asia_co2_per_gdp <- ggplot(usa_uk_eu27_china_ind_asia_data, aes(x=year, y=co2_per_gdp, group=country, col=country, fill=country)) +
  geom_point() +
  geom_line() + labs(x="Year", y="CO2 emissions per GDP (tonnes)") +theme_minimal()

usa_uk_eu27_china_ind_asia_co2_per_gdp

usa_uk_eu27_china_ind_asia_co2_per_energy <- ggplot(usa_uk_eu27_china_ind_asia_data, aes(x=year, y=co2_per_unit_energy, group=country, col=country, fill=country)) +
  geom_point() +
  geom_line() + labs(x="Year", y="Tonnes of C02 per unit of energy") +theme_minimal() +

usa_uk_eu27_china_ind_asia_co2_per_energy

usa_uk_eu27_china_ind_asia_co2_per_gdp_smooth <- ggplot(usa_uk_eu27_china_ind_asia_data, aes(x=year, y=co2_per_gdp, group=country, col=country, fill=country)) +
  geom_point() +
  geom_smooth() + labs(x="Year", y="Tonnes of C02 per GDP") +theme_minimal() 
  
 usa_uk_eu27_china_ind_asia_co2_per_gdp_smooth

 braz_sa_data <- subset(carbon_data, country =="Brazil"  | country=="South Africa")
 
  braz_sa_co2_per_gdp_smooth <- ggplot(braz_sa_data, aes(x=year, y=co2_per_gdp, group=country, col=country, fill=country)) +
   geom_point() +
   geom_smooth() + labs(x="Year", y="Tonnes of C02 per GDP") +theme_minimal() 
braz_sa_co2_per_gdp_smooth 

 


