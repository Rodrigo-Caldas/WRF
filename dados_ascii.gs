
'open /home/lammoc/wrf_operacional/operacional/ARWpost/2020-11-30_00:00:00_d03.ctl'

t=1
while(t<=96)
'set t 't
data=t

arqtxt=vent20201130.txt

x=1
while(x<=51)
'set x 'x
y=1
while(y<=60)
'set y 'y
'q dims'
lon2=sublin(result,2)
lon=subwrd(lon2,6)
lat2=sublin(result,3)
lat=subwrd(lat2,6)
'd u10'
val=subwrd (result,4)
'd v10'
val2=subwrd (result,4)
'd ws10'
val3=subwrd (result,4)
'd wd10'
val4=subwrd (result,4)

print=' ' data ' ' lon ' ' lat ' ' val ' ' val2 ' ' val3 ' ' val4
write(arqtxt,print,append)

y=y+1
endwhile
x=x+1
endwhile
t=t+1
endwhile

t=1
while(t<=96)
'set t 't
data=t

arqtxt=temp20201130.txt

x=1
while(x<=51)
'set x 'x
y=1
while(y<=60)
'set y 'y
'q dims'
lon2=sublin(result,2)
lon=subwrd(lon2,6)
lat2=sublin(result,3)
lat=subwrd(lat2,6)
'd t2-273'
val=subwrd (result,4)

print=' ' data ' ' lon ' ' lat ' ' val
write(arqtxt,print,append)

y=y+1
endwhile
x=x+1
endwhile
t=t+1
endwhile

t=1
while(t<=96)
'set t 't
data=t

arqtxt=prec20201130.txt

x=1
while(x<=51)
'set x 'x
y=1
while(y<=60)
'set y 'y
'q dims'
lon2=sublin(result,2)
lon=subwrd(lon2,6)
lat2=sublin(result,3)
lat=subwrd(lat2,6)
'define chu=rainc(t='t')-rainc(t='t-3')'
'define va=rainnc(t='t')-rainnc(t='t-3')' 
'd chu+va'
val=subwrd (result,4)

print=' ' data ' ' lon ' ' lat ' ' val
write(arqtxt,print,append)

y=y+1
endwhile
x=x+1
endwhile
t=t+1
endwhile


