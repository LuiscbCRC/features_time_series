rm(list=ls())

library(tsfeatures)
install.packages('WeightedPortTest')

x <- ts(diffinv(rnorm(500)));
all_characteristics <- NULL

#TSFEATS

#stability
all_characteristics <- append(all_characteristics,tsfeatures::stability(x))

#lumpiness
all_characteristics <- append(all_characteristics,tsfeatures::lumpiness(x))

#crossing.points.fraction
all_characteristics <- append(all_characteristics, tsfeatures::crossing_points(x))

#flat.spots.fraction
all_characteristics <- append(all_characteristics, tsfeatures::flat_spots(x))

#nonlinearity
all_characteristics <- append(all_characteristics, tsfeatures::nonlinearity(x))

#ur.kpss
all_characteristics <- append(all_characteristics, tsfeatures::unitroot_kpss(x))

#ur.pp
all_characteristics <- append(all_characteristics, tsfeatures::unitroot_pp(x))

#arch.lm
all_characteristics <- append(all_characteristics, tsfeatures::arch_stat(x))

#ACF1, 
all_characteristics <- append(all_characteristics, tsfeatures::acf_features(x)["x_acf1"])

#ACF10.SS
all_characteristics <- append(all_characteristics, tsfeatures::acf_features(x)["x_acf10"])

#ACF.seas
all_characteristics <- append(all_characteristics, tsfeatures::acf_features(x)["seas_acf1"])

#PACF10.SS *****
all_characteristics <- append(all_characteristics, tsfeatures::pacf_features(x)["x_pacf5"])

#PACF.seas
all_characteristics <- append(all_characteristics, tsfeatures::pacf_features(x)["seas_pacf"])


#STLFEATS: lambda ******

#nperiods
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["nperiods"])

#seasonal.period
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["seasonal_period"])

#trend
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["trend"])

#spike
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["spike"])

#linearity
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["linearity"])

#curvature
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["curvature"])

#e_acf1
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["e_acf1"])

#e_acf10
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["e_acf10"])

#seasonal_strength
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["seasonal_strength"])

#peak
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["peak"])

#trough
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["trough"])

#HCTSA

#embed2_incircle_1
all_characteristics <- append(all_characteristics, tsfeatures::embed2_incircle(x, boundary = 1))

#embed2_incircle_2
all_characteristics <- append(all_characteristics, tsfeatures::embed2_incircle(x, boundary = 2))

#ac_9
all_characteristics <- append(all_characteristics, tsfeatures::ac_9(x))

#firstmin_ac
all_characteristics <- append(all_characteristics, tsfeatures::firstmin_ac(x))

#treb_num
all_characteristics <- append(all_characteristics, tsfeatures::trev_num(x))

#motiftwo_entro3
all_characteristics <- append(all_characteristics, tsfeatures::motiftwo_entro3(x))

#walker_propcross
all_characteristics <- append(all_characteristics, tsfeatures::walker_propcross(x))

#std1st_der
all_characteristics <- append(all_characteristics, tsfeatures::std1st_der(x))

#boot.stationary.fixed


#boot.stationary.ac2


#histogram_mode **** 10?
all_characteristics <- append(all_characteristics, tsfeatures::histogram_mode(x))

#outlierinclude_mdrmd
all_characteristics <- append(all_characteristics, tsfeatures::outlierinclude_mdrmd(x))

#firstzero_ac
all_characteristics <- append(all_characteristics, tsfeatures::firstzero_ac(x))


#heterogeneity, portmanteau

#arch_acf
all_characteristics <- append(all_characteristics, tsfeatures::heterogeneity(x)["arch_acf"])

#garch_acf
all_characteristics <- append(all_characteristics, tsfeatures::heterogeneity(x)["garch_acf"])

#arch_r2
all_characteristics <- append(all_characteristics, tsfeatures::heterogeneity(x)["arch_r2"])

#garch_r2
all_characteristics <- append(all_characteristics, tsfeatures::heterogeneity(x)["garch_r2"])

#lag1.Ljung.Box
all_characteristics <- WeightedPortTest::Weighted.Box.test(x, lag = 1,
                  type = c("Box-Pierce", "Ljung-Box", "Monti"),
                  fitdf = 0, sqrd.res = FALSE,
                  log.sqrd.res = FALSE, abs.res = FALSE,
                  weighted = TRUE)
all_characteristics


#lagF.Ljung.Box



all_characteristics
plot(x)
