#!/bin/bash

#################################################################
# Script para extrair os dados nos pontos de grade do WRF
# para redes neurais
# Projeto FEC LAMMOC-DCNIT
# Criado em 18jul2021
#################################################################

# Caminho para os arquivos ascii
dir_ascii=/home/lammoc/wrf_operacional/operacional/scripts/dados_ascii

# Loop de data
AAAA=2021
MM=7
DD=9

########## Coordenadas da estacao #################
estacao="EngMato"
lonc="316.997"
latc="-22.938"
lonn="316.997"
latn="-22.8288"
lons="316.997"
lats="-22.8471"
lone="317.007"
late="-22.9385"
lonw="316.987"
latw="-22.9385"
lonne="317.007"
latne="-22.8288"
lonse="317.007"
latse="-22.8471"
lonnw="316.987"
latnw="-22.8288"
lonsw="316.987"
latsw="-22.8471"


while [ ${AAAA} -le 2021 ]
do
cd $dir_ascii/$AAAA

while [ ${MM} -le 12 ]
do
# Inserir digito zero nos meses abaixo de 9
if [ $MM -le 9 ];then
  MM=0$MM
  else
  MM=$MM
fi

while [ ${DD} -le 31 ]
do

# Inserir digito zero nos dias abaixo de 9
if [ $DD -le 9 ];then
  DD=0$DD
  else
  DD=$DD
fi

if [ ! -e $dir_ascii/${AAAA}/temp${AAAA}${MM}${DD}.tx* ]; then
   echo "nao existe o dado"      
else

# Define padrão da saida para a planilha final
header="%-8s %-8s %-8s %-8s %-8s %-8s %-8s %-8s %-8s %-8s %-8s\n"
format="%8s %8s %8s %8s %8s %8s %8s %8s %8s %8s %8s"

# Cria um arq TXT e add um cabecalho para as colunas.
        printf "$header" "   DATA   " "HORA" "${estacao}" "Pto N" "Pto S" "Pto E" "Pto W" "Pto SE" "Pto NE" "Pto SW" "Pto NW"  > $dir_ascii/extrai_rn/RN_temp_${estacao}_${AAAA}${MM}${DD}.txt

        printf "$header" "   DATA   " "HORA" "${estacao}" "Pto N" "Pto S" "Pto E" "Pto W" "Pto SE" "Pto NE" "Pto SW" "Pto NW"  > $dir_ascii/extrai_rn/RN_prec_${estacao}_${AAAA}${MM}${DD}.txt

# Começa o loop de tempo
t=1
while [ ${t} -le 48 ]
do

######### Temperatura ################
  temp_c0=`grep "$t $lonc $latc" temp$AAAA$MM$DD.txtt | awk '{ print $4 }'`
  temp_c=$(echo $temp_c0 | cut -d" " -f1)
  temp_n0=`grep "$t $lonn $latn" temp$AAAA$MM$DD.txtt | awk '{ print $4 }'`
  temp_n=$(echo $temp_n0 | cut -d" " -f1)
  temp_s0=`grep "$t $lons $lats" temp$AAAA$MM$DD.txtt | awk '{ print $4 }'`
  temp_s=$(echo $temp_s0 | cut -d" " -f1)
  temp_e0=`grep "$t $lone $late" temp$AAAA$MM$DD.txtt | awk '{ print $4 }'`
  temp_e=$(echo $temp_e0 | cut -d" " -f1)
  temp_w0=`grep "$t $lonw $latw" temp$AAAA$MM$DD.txtt | awk '{ print $4 }'`
  temp_w=$(echo $temp_w0 | cut -d" " -f1)
  temp_se0=`grep "$t $lonse $latse" temp$AAAA$MM$DD.txtt | awk '{ print $4 }'`
  temp_se=$(echo $temp_se0 | cut -d" " -f1)
  temp_ne0=`grep "$t $lonne $latne" temp$AAAA$MM$DD.txtt | awk '{ print $4 }'`
  temp_ne=$(echo $temp_ne0 | cut -d" " -f1)
  temp_sw0=`grep "$t $lonsw $latsw" temp$AAAA$MM$DD.txtt | awk '{ print $4 }'`
  temp_sw=$(echo $temp_sw0 | cut -d" " -f1)
  temp_nw0=`grep "$t $lonnw $latnw" temp$AAAA$MM$DD.txtt | awk '{ print $4 }'`
  temp_nw=$(echo $temp_nw0 | cut -d" " -f1)

######### Precipitacao ###############
  prec_c0=`grep "$t $lonc $latc" prec$AAAA$MM$DD.tx* | awk '{ print $4 }'`
  prec_c=$(echo $prec_c0 | cut -d" " -f1)
  prec_n0=`grep "$t $lonn $latn" prec$AAAA$MM$DD.tx* | awk '{ print $4 }'`
  prec_n=$(echo $prec_n0 | cut -d" " -f1)
  prec_s0=`grep "$t $lons $lats" prec$AAAA$MM$DD.tx* | awk '{ print $4 }'`
  prec_s=$(echo $prec_s0 | cut -d" " -f1)
  prec_e0=`grep "$t $lone $late" prec$AAAA$MM$DD.tx* | awk '{ print $4 }'`
  prec_e=$(echo $prec_e0 | cut -d" " -f1)
  prec_w0=`grep "$t $lonw $latw" prec$AAAA$MM$DD.tx* | awk '{ print $4 }'`
  prec_w=$(echo $prec_w0 | cut -d" " -f1)
  prec_se0=`grep "$t $lonse $latse" prec$AAAA$MM$DD.tx* | awk '{ print $4 }'`
  prec_se=$(echo $prec_se0 | cut -d" " -f1)
  prec_ne0=`grep "$t $lonne $latne" prec$AAAA$MM$DD.tx* | awk '{ print $4 }'`
  prec_ne=$(echo $prec_ne0 | cut -d" " -f1)
  prec_sw0=`grep "$t $lonsw $latsw" prec$AAAA$MM$DD.tx* | awk '{ print $4 }'`
  prec_sw=$(echo $prec_sw0 | cut -d" " -f1)
  prec_nw0=`grep "$t $lonnw $latnw" prec$AAAA$MM$DD.tx* | awk '{ print $4 }'`
  prec_nw=$(echo $prec_nw0 | cut -d" " -f1)


# Escrevendo na planilha final
# Ordem da planilha:
# "DATA " "HORA " "Estacao" "Pto N" "Pto S" "Pto E" "Pto W" "Pto SE" "Pto NE" "Pto SW" "Pto NW"

### temperatura ####
  printf "$format" "${AAAA}${MM}${DD}" "${t}   " " ${temp_c}" "${temp_n}" " ${temp_s}" " ${temp_e}" " ${temp_w}" " ${temp_se}" " ${temp_ne}" " ${temp_sw}" " ${temp_nw}" >> $dir_ascii/extrai_rn/RN_temp_${estacao}_${AAAA}${MM}${DD}.txt

  printf "\n" >> $dir_ascii/extrai_rn/RN_temp_${estacao}_${AAAA}${MM}${DD}.txt


#### precipitação ####
  printf "$format" "${AAAA}${MM}${DD}" "${t}   " " ${prec_c}" "${prec_n}" " ${prec_s}" " ${prec_e}" " ${prec_w}" " ${prec_se}" " ${prec_ne}" " ${prec_sw}" " ${prec_nw}" >> $dir_ascii/extrai_rn/RN_prec_${estacao}_${AAAA}${MM}${DD}.txt

  printf "\n" >> $dir_ascii/extrai_rn/RN_prec_${estacao}_${AAAA}${MM}${DD}.txt

  t=`expr $t + 1`

done
fi 

t=1
  DD=`expr $DD + 1`
done
DD=1
MM=$MM
  MM=`expr $MM + 1`
done
MM=1
  AAAA=`expr $AAAA + 1`
done

##################### SOMENTE VENTO NO FORMATO DIFERENTE #########################
##################################################################################

# Loop de data
AAAA=2021
MM=7
DD=9

while [ ${AAAA} -le 2021 ]
do
cd $dir_ascii/$AAAA

while [ ${MM} -le 12 ]
do
# Inserir digito zero nos meses abaixo de 9
if [ $MM -le 9 ];then
  MM=0$MM
  else
  MM=$MM
fi

while [ ${DD} -le 31 ]
do

# Inserir digito zero nos dias abaixo de 9
if [ $DD -le 9 ];then
  DD=0$DD
  else
  DD=$DD
fi

if [ ! -e $dir_ascii/${AAAA}/vent${AAAA}${MM}${DD}.txtt ]; then
   echo "nao existe o dado"      
else


# Define padrão da saida para a planilha final de vento
header="%-8s %-8s %-12s %-12s %-12s %-12s %-12s %-12s %-12s %-12s %-12s %-12s %-12s %-12s %-12s %-12s %-12s %-12s %-12s %-12s\n"
format="%8s %8s %12s %12s %12s %12s %12s %12s %12s %12s %12s %12s %12s %12s %12s %12s %12s %12s %12s %12s"

        printf "$header" "   DATA   " "HORA" "${estacao}_ws10" "${estacao}_wd10" "Pto N_ws10" "Pto N_wd10" "Pto S_ws10" "Pto S_wd10" "Pto E_ws10" "Pto E_wd10" "Pto W_ws10" "Pto W_wd10" "Pto SE_ws10" "Pto SE_wd10" "Pto NE_ws10" "Pto NE_wd10" "Pto SW_ws10" "Pto SW_wd10" "Pto NW_ws10" "Pto NW_wd10" > $dir_ascii/extrai_rn/RN_vent_${estacao}_${AAAA}${MM}${DD}.txt

# Começa o loop de tempo
t=1
while [ ${t} -le 48 ]
do

################## Vento #########################################
  ws10_c0=`grep "$t $lonc $latc" vent$AAAA$MM$DD.txtt | awk '{ print $6 }'`
  ws10_c=$(echo $ws10_c0 | cut -d" " -f1)
  wd10_c0=`grep "$t $lonc $latc" vent$AAAA$MM$DD.txtt | awk '{ print $7 }'`
  wd10_c=$(echo $wd10_c0 | cut -d" " -f1)
  ws10_n0=`grep "$t $lonn $latn" vent$AAAA$MM$DD.txtt | awk '{ print $6 }'`
  ws10_n=$(echo $ws10_n0 | cut -d" " -f1)
  wd10_n0=`grep "$t $lonn $latn" vent$AAAA$MM$DD.txtt | awk '{ print $7 }'`
  wd10_n=$(echo $wd10_n0 | cut -d" " -f1)
  ws10_s0=`grep "$t $lons $lats" vent$AAAA$MM$DD.txtt | awk '{ print $6 }'`
  ws10_s=$(echo $ws10_s0 | cut -d" " -f1)
  wd10_s0=`grep "$t $lons $lats" vent$AAAA$MM$DD.txtt | awk '{ print $7 }'`
  wd10_s=$(echo $wd10_s0 | cut -d" " -f1)
  ws10_e0=`grep "$t $lone $late" vent$AAAA$MM$DD.txtt | awk '{ print $6 }'`
  ws10_e=$(echo $ws10_e0 | cut -d" " -f1)
  wd10_e0=`grep "$t $lone $late" vent$AAAA$MM$DD.txtt | awk '{ print $7 }'`
  wd10_e=$(echo $wd10_e0 | cut -d" " -f1)
  ws10_w0=`grep "$t $lonw $latw" vent$AAAA$MM$DD.txtt | awk '{ print $6 }'`
  ws10_w=$(echo $ws10_w0 | cut -d" " -f1)
  wd10_w0=`grep "$t $lonw $latw" vent$AAAA$MM$DD.txtt | awk '{ print $7 }'`
  wd10_w=$(echo $wd10_w0 | cut -d" " -f1)
  ws10_se0=`grep "$t $lonse $latse" vent$AAAA$MM$DD.txtt | awk '{ print $6 }'`
  ws10_se=$(echo $ws10_se0 | cut -d" " -f1)
  wd10_se0=`grep "$t $lonse $latse" vent$AAAA$MM$DD.txtt | awk '{ print $7 }'`
  wd10_se=$(echo $wd10_se0 | cut -d" " -f1)
  ws10_ne0=`grep "$t $lonne $latne" vent$AAAA$MM$DD.txtt | awk '{ print $6 }'`
  ws10_ne=$(echo $ws10_ne0 | cut -d" " -f1)
  wd10_ne0=`grep "$t $lonne $latne" vent$AAAA$MM$DD.txtt | awk '{ print $7 }'`
  wd10_ne=$(echo $wd10_ne0 | cut -d" " -f1)
  ws10_sw0=`grep "$t $lonsw $latsw" vent$AAAA$MM$DD.txtt | awk '{ print $6 }'`
  ws10_sw=$(echo $ws10_sw0 | cut -d" " -f1)
  wd10_sw0=`grep "$t $lonsw $latsw" vent$AAAA$MM$DD.txtt | awk '{ print $7 }'`
  wd10_sw=$(echo $wd10_sw0 | cut -d" " -f1)
  ws10_nw0=`grep "$t $lonnw $latnw" vent$AAAA$MM$DD.txtt | awk '{ print $6 }'`
  ws10_nw=$(echo $ws10_nw0 | cut -d" " -f1)
  wd10_nw0=`grep "$t $lonnw $latnw" vent$AAAA$MM$DD.txtt | awk '{ print $7 }'`
  wd10_nw=$(echo $wd10_nw0 | cut -d" " -f1)


#### vento ####
  printf "$format" "${AAAA}${MM}${DD}" "${t}   " " ${ws10_c}" " ${wd10_c}" " ${ws10_n}" " ${wd10_n}" " ${ws10_s}" " ${wd10_s}" " ${ws10_e}" " ${wd10_e}" " ${ws10_w}" " ${wd10_w}" " ${ws10_se}" " ${wd10_se}" " ${ws10_ne}" " ${wd10_ne}" " ${ws10_sw}" " ${wd10_sw}" " ${ws10_nw}" " ${wd10_nw}" >> $dir_ascii/extrai_rn/RN_vent_${estacao}_${AAAA}${MM}${DD}.txt

  printf "\n" >> $dir_ascii/extrai_rn/RN_vent_${estacao}_${AAAA}${MM}${DD}.txt

  t=`expr $t + 1`
done
fi
t=1
  DD=`expr $DD + 1`
done
DD=1
MM=$MM
  MM=`expr $MM + 1`
done
MM=1
  AAAA=`expr $AAAA + 1`
done
