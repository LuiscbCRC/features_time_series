rm(list=ls())

install.packages('tsfeatures')
install.packages('WeightedPortTest')
install.packages('fractaldim')
install.packages('TSEntropies')
install.packages('ForeCA')
install.packages('pracma')
install.packages('anomalize')
install.packages('tidyverse')
install.packages('wavelets')

library(tsfeatures)
library(WeightedPortTest)
library(fractaldim)
library(TSEntropies)
library(ForeCA)
library(pracma)
library(anomalize)
library(tidyverse)
library(wavelets)

x <- ts(diffinv(rnorm(10000)));
all_characteristics <- NULL


###TSFEATS###
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

#ACF1
all_characteristics <- append(all_characteristics, tsfeatures::acf_features(x)["x_acf1"])

#ACF10.SS
all_characteristics <- append(all_characteristics, tsfeatures::acf_features(x)["x_acf10"])

#ACF.seas
all_characteristics <- append(all_characteristics, tsfeatures::acf_features(x)["seas_acf1"]) # Returning NA value (AirPassangers format)

#PACF10.SS
all_characteristics <- append(all_characteristics, tsfeatures::pacf_features(x)["diff2x_pacf5"])

#PACF.seas
all_characteristics <- append(all_characteristics, tsfeatures::pacf_features(x)["x_pacf5"])


###STLFEATS###
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
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["seasonal_strength"]) #Returning NA Value (AirPassangers)

#peak
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["peak"]) #Returning NA Value (AirPassangers)

#trough
all_characteristics <- append(all_characteristics, tsfeatures::stl_features(x)["trough"]) #Returning NA Value (AirPassangers)

#lambda
#Sin implementacion


###HCTSA###
#embed2_incircle_1
all_characteristics <- append(all_characteristics, tsfeatures::embed2_incircle(x, boundary = 1)) #Returning always 0??

#embed2_incircle_2
all_characteristics <- append(all_characteristics, tsfeatures::embed2_incircle(x, boundary = 2)) #Returning always 0??

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
#Sin implementacion

#boot.stationary.ac2
#Sin Implementacion

#histogram_mode
all_characteristics <- append(all_characteristics, tsfeatures::histogram_mode(x))

#outlierinclude_mdrmd
all_characteristics <- append(all_characteristics, tsfeatures::outlierinclude_mdrmd(x))

#firstzero_ac
all_characteristics <- append(all_characteristics, tsfeatures::firstzero_ac(x))


###HCTSA###
#arch_acf
all_characteristics <- append(all_characteristics, tsfeatures::heterogeneity(x)["arch_acf"])

#garch_acf
all_characteristics <- append(all_characteristics, tsfeatures::heterogeneity(x)["garch_acf"])

#arch_r2
all_characteristics <- append(all_characteristics, tsfeatures::heterogeneity(x)["arch_r2"])

#garch_r2
all_characteristics <- append(all_characteristics, tsfeatures::heterogeneity(x)["garch_r2"])

#Parte de Kevin Ljung Box? Investigar parametros

###FRACTALDIM###
# Returning value analysis: https://rdrr.io/cran/fractaldim/man/fd.estimate.html
#Hallwood
all_characteristics <- append(all_characteristics, fractaldim::fd.estim.hallwood(x))

#DCT
all_characteristics <- append(all_characteristics, fractaldim::fd.estim.dctII(x))

#Wavelet Requires wavelet package
all_characteristics <- append(all_characteristics, fractaldim::fd.estim.wavelet(x))

#Variogram
all_characteristics <- append(all_characteristics, fractaldim::fd.estim.variogram(x))

#Madogram
all_characteristics <- append(all_characteristics, fractaldim::fd.estim.madogram(x))

#Rodogram
all_characteristics <- append(all_characteristics, fractaldim::fd.estim.rodogram(x))

#Periodogram
all_characteristics <- append(all_characteristics, fractaldim::fd.estim.periodogram(x))
                
#Entropy
#Approximate
all_characteristics <- append(all_characteristics, TSEntropies::ApEn(x))

#Fast Sample
all_characteristics <- append(all_characteristics, TSEntropies::FastSampEn_R(x))

#Fast Aprox
all_characteristics <- append(all_characteristics, TSEntropies::FastApEn_R(x))

#Spectral
#Problemas para encontrar las implementaciones correctas en ForeCA

###ANOMALY###
#Problemas para encontrar la implmentacion correcta para anomaly
#https://cran.r-project.org/web/packages/anomalize/vignettes/anomalize_methods.html

#pracma
#https://cran.r-project.org/web/packages/pracma/pracma.pdf

#anomalize
#https://cran.r-project.org/web/packages/anomalize/anomalize.pdf
