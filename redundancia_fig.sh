#!/bin/bash

#### SCRIPT PARA VRF NOME E TAMANHO DA FIGURAS NA DC NITEROI #########
##### E COMPLETAR CASO HAJA FALHA NO ENVIO DAS FIGURAS PELA #########
######## MAQUINA DA UFF ##########################################

#HOST='ftp.bugarintecnologia.rio'
#USER='bugarintecnologia.rio'
#PASSWD='nossubsub'
FIGLAMMOC=/home/wrf/WRF/figuras
FIGTESTE=/home/wrf/WRF/dc_niteroi/figuras_dc

HH=00
# variavel data pega o dia de hoje
DATA=`date +'%d'`
echo "Dia de hoje $DATA"
TAMREF=4


# Declara as figuras do WRF que serao conferidas no servidor da DCNit
declare -a var1='([0]="prec" [1]="parnm" [2]="uv1000" [3]="uv850" [4]="uv200" [5]="t2m" [6]="uv700" [7]="U850" [8]="U1000")'
declare -a var2='([0]="Brasil" [1]="Estado_RJ" [2]="Regiao_Metropolitana")'
for i in 0 1 2 3 4 5 6 7 8
do
  for j in 0 1 2
  do

# FIGDC=imagens/${var2[$j]}/${var1[$i]}/

# Contador para hora das figuras

z=0
# k = numero de dias de previsao

     for k in 0 1 
     do

 while [ ${z} -lt 24 ];
 do



# Nome do arquivo da figura
  files=${var1[$i]}'_1_'$[j+1]'_'$[k+1]'_'$[z]'Z.gif'
echo "$files"

#Conferencia de nome e tamanho das figuras:

# dir teste:
cd $FIGTESTE

# se existe a figura confira a data, o tamanho, se nao existe transfira a nova figura

        if [ -f ${FIGTESTE}/${files} ]; then
                echo "$files"
                tam=`du -s $files | awk '{ print $1 }'`
                echo "$tam"
                echo "$files"
                dia_fig=`ls -ltr $files | awk '{ print $7 }'`
                echo "$dia_fig"

                if [ $DATA == $dia_fig ];then
                        echo "$files figura com data de hoje"
                        echo
                else
                        echo "$files desatualizada, vou enviar figura redundante"
                        #mput $files
                        cp $FIGLAMMOC/$files $FIGTESTE/$files 
                        echo
                fi
                if [ $tam -le $TAMREF ];then
                        echo "$files com tamanho ERRADO, vou enviar figura redundante"
                        #mput $files
                        cp $FIGLAMMOC/$files $FIGTESTE/$files
                        echo
                else
                        echo "Dado com tamanho normal"
                        echo
                fi
        else
                echo "$files nao existe, vou enviar imagem redundante"
                #mput $files
                cp $FIGLAMMOC/$files $FIGTESTE/$files
                echo
        fi
 z=`expr $z + 1`
 done
#p=`expr $p + 1`
done

done
done
