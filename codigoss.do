describe
xtset country year, yearly
import delimited C:\Users\Augusto\Desktop\DadosT2.csv, delimiter(";") 
describe
xtset country year, yearly
xtsum rgdppc ropen consu inv
reg rgdppc l.rgdppc ropen l.ropen inv l.inv consu l.consu
reg rgdppc l.rgdppc ropen l.ropen inv l.inv consu l.consu, vce (cluster country)
estimates store POLS
reg rgdppc l.rgdppc ropen l.ropen inv l.inv consu l.consu y2002-y2007, vce (cluster country)
estimates store POLS1
xtreg rgdppc l.rgdppc ropen l.ropen inv l.inv consu l.consu, fe vce (cluster country)
estimates store FE
xtreg rgdppc l.rgdppc ropen l.ropen inv l.inv consu l.consu y2002-y2007, fe vce (cluster country)
estimates store FE1
*First Dif
reg D. (rgdppc l.rgdppc ropen l.ropen inv l.inv consu l.consu), nocons vce (cluster country)
reg D.(rgdppc l.rgdppc ropen l.ropen inv l.inv consu l.consu), nocons vce (cluster country)
estimates store FD
reg D.(rgdppc l.rgdppc ropen l.ropen inv l.inv consu l.consu y2002-y2007), nocons vce (cluster country)
estimates store FD1
estimates table POLS FE FD, star(.1 .05 .01)
estimates table POLS1 FE1 FD1, star(.1 .05 .01)
ssc install xtabond2
xtabond2 rgdppc l.rgdppc ropen l.ropen inv l.inv consu l.consu y2002-y2007, iv( ropen consu inv y2002-y2007) gmm(l.rgdppc) noleveleq robust
save "C:\Users\Augusto\Desktop\Codigo.dta"
help do
