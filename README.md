# ThaiProvince
#Create an R Function to Convert Province Codes to Full Province Name 
#'x' is the column of a data.frame that holds 2 digit state codes
ThaiProvince <-function(x) {
  st.codes<-data.frame(
                  state=as.factor(c("AC","AT","BM","BK","BR","CC","CN","CY","CT","CM","CR","CB","CP","KL","KP","KN","KK","KR","LG","LN","LE","LB","MH","MS","MD","NN","NP","NF","NR","NS","NT","NA","NW","NB","NH","NO","PT","PI","PG","PL","PY","PH","PE","PC","PS","PR","PA","PU","PB","PK","RN","RT","RY","RE","SK","SN","SP","SS","SM","SR","SA","SB","SI","SG","SO","SH","ST","SU","TK","TG","TT","UR","UN","UT","UD","YL","YS")),
                  full=as.factor(c("Amnat Charoen","Ang Thong","Bangkok Metropolis","Bueng Kan","Buri Ram","Chachoengsao","Chai Nat","Chaiyaphum","Chanthaburi","Chiang Mai","Chiang Rai","Chon Buri","Chumphon","Kalasin","Kamphaeng Phet","Kanchanaburi","Khon Kaen","Krabi","Lampang","Lamphun","Loei","Lop Buri","Mae Hong Son","Maha Sarakham","Mukdahan","Nakhon Nayok","Nakhon Pathom","Nakhon Phanom","Nakhon Ratchasima","Nakhon Sawan","Nakhon Si Thammarat","Nan","Narathiwat","Nong Bua Lam Phu","Nong Khai","Nonthaburi","Pathum Thani","Pattani","Phangnga","Phatthalung","Phayao","Phetchabun","Phetchaburi","Phichit","Phitsanulok","Phrae","Phra Nakhon Si Ayutthaya","Phuket","Prachin Buri","Prachuap Khiri Khan","Ranong","Ratchaburi","Rayong","Roi Et","Sa Kaeo","Sakon Nakhon","Samut Prakan","Samut Sakhon","Samut Songkhram","Saraburi","Satun","Sing Buri","Si Sa Ket","Songkhla","Sukhothai","Suphan Buri","Surat Thani","Surin","Tak","Trang","Trat","Ubon Ratchathani","Udon Thani","Uthai Thani","Uttaradit","Yala","Yasothon"))
                       )
     #create an nx1 data.frame of state codes from source column
  st.x<-data.frame(state=x)
     #match source codes with codes from 'st.codes' local variable and use to return the full state name
  refac.x<-st.codes$full[match(st.x$state,st.codes$state)]
     #return the full state names in the same order in which they appeared in the original source
  return(refac.x)
 
}
