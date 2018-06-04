#!/bin/bash
#pwd
cp changeDictionaryDict		changeDictionaryDict.0
cp changeDictionaryDict.0	changeDictionaryDict.mod 

# bdcnt names
replist="pressureInletOutletVelocity noSlip zeroGradient totalPressure cyclicACMI turbulentIntensityKineticEnergyInlet kqRWallFunction inletOutlet fixedValue epsilonWallFunction nutUWallFunction calculated turbulentMixingLengthDissipationRateInlet ) ''"
modfile=changeDictionaryDict.mod 
for w in $replist
do
        x=${w}';'
        #echo $x
        sed -i "/$x$/{
        N
        s:$x\n:$x:
        }" $modfile
done

        x=';'
        #echo $x
        sed -i "/$x$/{
        N
        s:$x\n:$x:
        }" $modfile


replist2="type blockage circwalls binlet outlet innerWalls"
for w in $replist2
do
        x=${w}
        #echo $x
        sed -i "/$x$/{
        N
        s:$x\n:$x:
        }" $modfile
done

for i in `seq 0 5`
do
        x=sidewall$i
        #echo $i
        sed -i "/$x$/{
        N
        s:$x\n:$x:
        }"  $modfile 
done

for i in `seq 0 5`
do
        x=outerWall$i
        #echo $i
        sed -i "/$x$/{
        N
        s:$x\n:$x:
        }" $modfile 
done

for i in `seq 0 5`
do
        x='{'
        #echo $x
        sed -i "/$x$/{
        N
        s:$x\n:$x:
        }"  $modfile 
done


#


for i in `seq 0 5`
do
        x=sidewall$i
        #echo $i
        sed -i "/$x$/{
        N
        s:.$x\n:$x:
        }"  $modfile 
done


for i in `seq 0 9`
do
        sed -i 's/\t\t/\t/g' changeDictionaryDict.mod
        sed -i 's/{\t/{/g' changeDictionaryDict.mod
done

sed -i 's/\t}/}/g' changeDictionaryDict.mod

sed -e :a -e '$!N;s/\n\t}/ /;ta' -e 'P;D' changeDictionaryDict.mod > changeDictionaryDict.new

# if a line begins with an equal sign, append it to the previous line
# and replace the "=" with a single space
# sed -e :a -e '$!N;s/\n=/ /;ta' -e 'P;D'
