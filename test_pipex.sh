RED="\033[38;5;161m"
GREEN="\033[38;5;154m"
YELLOW="\033[38;5;227m"
BLUE="\033[38;5;81m"
PURPLE="\033[38;5;93m"
PINK="\033[38;5;219m"
NC="\033[0m"

testnbr=1
printf "\n🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲\n"
printf "$GREEN\n\t🌟=======ALCABALL PIPEX TESTER========🌟\n$NC"
printf "$PINK\nIf there's any issue or something to improve, pls tell me!! :)\n\
	(I'm always at the campus and I'm 24/7 on Slack)\n"
printf "\n🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲\n"

r_code=0
p_code=0
errmsg=0
goodcode=0
gooddiff=0
gooderr=0
diffwc=0

touch bashout.txt
printf "\n$BLUE====TEST $testnbr ==============$YELLOW(normal input)\n$NC"
errmsg=$(../pipex "infile.txt" "ls" "cat" "pipexout.txt" 2> testerr.txt; cat testerr.txt | wc -l)
if [ $errmsg -eq 0 ]
	then
		gooderr=$(($gooderr + 1))
		printf "$GREEN\nShell Output (Errors): OK\n"
	else
		printf "$RED\nShell Output (Errors): KO\n"
fi
printf "$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(../pipex "infile.txt" "ls" "cat" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt ls | cat > bashout.txt; echo $?)
diffwc=$(diff pipexout.txt bashout.txt | wc -l)
if [ $diffwc -eq 0 ]
	then
		gooddiff=$(($gooddiff + 1))
		printf "$GREEN\nOutput File: OK!\n"
	else
		printf "$RED\nOutput File: KO!\n"
fi
printf "$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
if [ $r_code -eq $p_code ]
	then
		printf "$GREEN\nExit Codes OK!$NC pipex: $p_code // real: $r_code\n"
		goodcode=$(($goodcode + 1))
	else
		printf "$RED\nExit Codes KO$NC pipex: $p_code // real: $r_code\n"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(nonexistent infile)\n$NC"
errmsg=$(../pipex "jfkasdjfkas" "ls" "cat" "pipexout.txt" 2> testerr.txt; cat testerr.txt | grep "o such file" | wc -l)
if [ $errmsg -eq 1 ]
	then
		gooderr=$(($gooderr + 1))
		printf "$GREEN\nShell Output (Errors): OK\n"
	else
		printf "$RED\nShell Output (Errors): KO\n"
fi
printf "$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(../pipex "jfkasdjfkas" "ls" "cat" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<jfkasdjfkas ls | cat > bashout.txt; echo $?)
diffwc=$(diff pipexout.txt bashout.txt | wc -l)
if [ $diffwc -eq 0 ]
	then
		gooddiff=$(($gooddiff + 1))
		printf "$GREEN\nOutput File: OK!\n"
	else
		printf "$RED\nOutput File: KO!\n"
fi
printf "$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
if [ $r_code -eq $p_code ]
	then
		printf "$GREEN\nExit Codes OK!$NC pipex: $p_code // real: $r_code\n"
		goodcode=$(($goodcode + 1))
	else
		printf "$RED\nExit Codes KO$NC pipex: $p_code // real: $r_code\n"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(dev/random)\n$NC"
errmsg=$(../pipex "/dev/random" "cat" "head -1" "pipexout.txt" 2> testerr.txt; cat testerr.txt | wc -l)
if [ $errmsg -eq 0 ]
	then
		gooderr=$(($gooderr + 1))
		printf "$GREEN\nShell Output (Errors): OK\n"
	else
		printf "$RED\nShell Output (Errors): KO\n"
fi
printf "$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(../pipex "/dev/random" "cat" "head -1" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(</dev/random cat | head -1 > bashout.txt; echo $?)
gooddiff=$(($gooddiff + 1))
printf "$GREEN\nOutput File: Can't execute diff, assuming OK :)\n"
printf "$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
if [ $r_code -eq $p_code ]
	then
		printf "$GREEN\nExit Codes OK!$NC pipex: $p_code // real: $r_code\n"
		goodcode=$(($goodcode + 1))
	else
		printf "$RED\nExit Codes KO$NC pipex: $p_code // real: $r_code\n"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(cat cat)\n$NC"
errmsg=$(../pipex "infile.txt" "cat" "cat" "pipexout.txt"2> testerr.txt; cat testerr.txt | wc -l)
if [ $errmsg -eq 0 ]
	then
		gooderr=$(($gooderr + 1))
		printf "$GREEN\nShell Output (Errors): OK\n"
	else
		printf "$RED\nShell Output (Errors): KO\n"
fi
printf "$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(../pipex "infile.txt" "cat" "cat" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat | cat > bashout.txt; echo $?)
diffwc=$(diff pipexout.txt bashout.txt | wc -l)
if [ $diffwc -eq 0 ]
	then
		gooddiff=$(($gooddiff + 1))
		printf "$GREEN\nOutput File: OK!\n"
	else
		printf "$RED\nOutput File: KO!\n"
fi
printf "$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
if [ $r_code -eq $p_code ]
	then
		printf "$GREEN\nExit Codes OK!$NC pipex: $p_code // real: $r_code\n"
		goodcode=$(($goodcode + 1))
	else
		printf "$RED\nExit Codes KO$NC pipex: $p_code // real: $r_code\n"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(cmd 1 invalid, cmd 2 doesn't need input)\n$NC"
errmsg=$(../pipex "infile.txt" "jfkdjfdkj" "ls" "pipexout.txt" 2> testerr.txt; cat testerr.txt | grep "ommand not found" | wc -l)
if [ $errmsg -eq 1 ]
	then
		gooderr=$(($gooderr + 1))
		printf "$GREEN\nShell Output (Errors): OK\n"
	else
		printf "$RED\nShell Output (Errors): KO\n"
fi
printf "$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(../pipex "infile.txt" "jfkdjfdkj" "ls" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt jfkdjfdkj | ls > bashout.txt; echo $?)
diffwc=$(diff pipexout.txt bashout.txt | wc -l)
if [ $diffwc -eq 0 ]
	then
		gooddiff=$(($gooddiff + 1))
		printf "$GREEN\nOutput File: OK!\n"
	else
		printf "$RED\nOutput File: KO!\n"
fi
printf "$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
if [ $r_code -eq $p_code ]
	then
		printf "$GREEN\nExit Codes OK!$NC pipex: $p_code // real: $r_code\n"
		goodcode=$(($goodcode + 1))
	else
		printf "$RED\nExit Codes KO$NC pipex: $p_code // real: $r_code\n"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(cmd 1 valid, cmd 2 invalid)\n$NC"
errmsg=$(../pipex "infile.txt" "cat" "fjsdkalfjjds" "pipexout.txt" 2> testerr.txt; cat testerr.txt | grep "ommand not found" | wc -l)
if [ $errmsg -eq 1 ]
	then
		gooderr=$(($gooderr + 1))
		printf "$GREEN\nShell Output (Errors): OK\n"
	else
		printf "$RED\nShell Output (Errors): KO\n"
fi
printf "$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(../pipex "infile.txt" "cat" "fjsdkalfjjds" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat | fjsdkalfjjds > bashout.txt; echo $?)
diffwc=$(diff pipexout.txt bashout.txt | wc -l)
if [ $diffwc -eq 0 ]
	then
		gooddiff=$(($gooddiff + 1))
		printf "$GREEN\nOutput File: OK!\n"
	else
		printf "$RED\nOutput File: KO!\n"
fi
printf "$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
if [ $r_code -eq $p_code ]
	then
		printf "$GREEN\nExit Codes OK!$NC pipex: $p_code // real: $r_code\n"
		goodcode=$(($goodcode + 1))
	else
		printf "$RED\nExit Codes KO$NC pipex: $p_code // real: $r_code\n"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(cmd 1 invalid flags, cmd 2 doesn't need input)\n$NC"
errmsg=$(../pipex "infile.txt" "cat -ghj747" "ls" "pipexout.txt" 2> testerr.txt; cat testerr.txt | grep "illegal option" | wc -l)
if [ $errmsg -eq 1 ]
	then
		gooderr=$(($gooderr + 1))
		printf "$GREEN\nShell Output (Errors): OK\n"
	else
		printf "$RED\nShell Output (Errors): KO\n"
fi
printf "$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(../pipex "infile.txt" "cat -ghj747" "ls" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat -ghj747 | ls > bashout.txt; echo $?)
diffwc=$(diff pipexout.txt bashout.txt | wc -l)
if [ $diffwc -eq 0 ]
	then
		gooddiff=$(($gooddiff + 1))
		printf "$GREEN\nOutput File: OK!\n"
	else
		printf "$RED\nOutput File: KO!\n"
fi
printf "$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
if [ $r_code -eq $p_code ]
	then
		printf "$GREEN\nExit Codes OK!$NC pipex: $p_code // real: $r_code\n"
		goodcode=$(($goodcode + 1))
	else
		printf "$RED\nExit Codes KO$NC pipex: $p_code // real: $r_code\n"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(cmd 1 valid, cmd 2 invalid flags)\n$NC"
errmsg=$(../pipex "infile.txt" "cat" "cat -dfsa2332" "pipexout.txt" 2> testerr.txt; cat testerr.txt | grep "illegal option" | wc -l)
if [ $errmsg -eq 1 ]
	then
		gooderr=$(($gooderr + 1))
		printf "$GREEN\nShell Output (Errors): OK\n"
	else
		printf "$RED\nShell Output (Errors): KO\n"
fi
printf "$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(../pipex "infile.txt" "cat" "cat -dfsa2332" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat | cat -dfsa2332 > bashout.txt; echo $?)
diffwc=$(diff pipexout.txt bashout.txt | wc -l)
if [ $diffwc -eq 0 ]
	then
		gooddiff=$(($gooddiff + 1))
		printf "$GREEN\nOutput File: OK!\n"
	else
		printf "$RED\nOutput File: KO!\n"
fi
printf "$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
if [ $r_code -eq $p_code ]
	then
		printf "$GREEN\nExit Codes OK!$NC pipex: $p_code // real: $r_code\n"
		goodcode=$(($goodcode + 1))
	else
		printf "$RED\nExit Codes KO$NC pipex: $p_code // real: $r_code\n"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(absolute paths for cmds)\n$NC"
errmsg=$(../pipex "infile.txt" "/bin/cat" "/bin/ls" "pipexout.txt" 2> testerr.txt; cat testerr.txt | wc -l)
if [ $errmsg -eq 0 ]
	then
		gooderr=$(($gooderr + 1))
		printf "$GREEN\nShell Output (Errors): OK\n"
	else
		printf "$RED\nShell Output (Errors): KO\n"
fi
printf "$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(../pipex "infile.txt" "/bin/cat" "/bin/ls" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt /bin/cat | /bin/ls > bashout.txt; echo $?)
diffwc=$(diff pipexout.txt bashout.txt | wc -l)
if [ $diffwc -eq 0 ]
	then
		gooddiff=$(($gooddiff + 1))
		printf "$GREEN\nOutput File: OK!\n"
	else
		printf "$RED\nOutput File: KO!\n"
fi
printf "$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
if [ $r_code -eq $p_code ]
	then
		printf "$GREEN\nExit Codes OK!$NC pipex: $p_code // real: $r_code\n"
		goodcode=$(($goodcode + 1))
	else
		printf "$RED\nExit Codes KO$NC pipex: $p_code // real: $r_code\n"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(permission denied infile)\n$NC"
chmod a-r infile.txt
errmsg=$(../pipex "infile.txt" "cat" "cat" "pipexout.txt" 2> testerr.txt; cat testerr.txt | grep "ermission denied" | wc -l)
if [ $errmsg -eq 1 ]
	then
		gooderr=$(($gooderr + 1))
		printf "$GREEN\nShell Output (Errors): OK\n"
	else
		printf "$RED\nShell Output (Errors): KO\n"
fi
printf "$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(../pipex "infile.txt" "cat" "cat" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat | cat > bashout.txt; echo $?)
diffwc=$(diff pipexout.txt bashout.txt | wc -l)
if [ $diffwc -eq 0 ]
	then
		gooddiff=$(($gooddiff + 1))
		printf "$GREEN\nOutput File: OK!\n"
	else
		printf "$RED\nOutput File: KO!\n"
fi
printf "$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
chmod a+rw infile.txt
if [ $r_code -eq $p_code ]
	then
		printf "$GREEN\nExit Codes OK!$NC pipex: $p_code // real: $r_code\n"
		goodcode=$(($goodcode + 1))
	else
		printf "$RED\nExit Codes KO$NC pipex: $p_code // real: $r_code\n"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(permission denied outfile)\n$NC"
chmod a-w pipexout.txt
chmod a-w bashout.txt
errmsg=$(../pipex "infile.txt" "cat" "ls" "pipexout.txt" 2> testerr.txt; cat testerr.txt | grep "ermission denied" | wc -l)
if [ $errmsg -eq 1 ]
	then
		gooderr=$(($gooderr + 1))
		printf "$GREEN\nShell Output (Errors): OK\n"
	else
		printf "$RED\nShell Output (Errors): KO\n"
fi
printf "$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(../pipex "infile.txt" "cat" "ls" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat | ls > bashout.txt; echo $?)
diffwc=$(diff pipexout.txt bashout.txt | wc -l)
if [ $diffwc -eq 0 ]
	then
		gooddiff=$(($gooddiff + 1))
		printf "$GREEN\nOutput File: OK!\n"
	else
		printf "$RED\nOutput File: KO!\n"
fi
printf "$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
chmod a+w pipexout.txt
chmod a+w bashout.txt
if [ $r_code -eq $p_code ]
	then
		printf "$GREEN\nExit Codes OK!$NC pipex: $p_code // real: $r_code\n"
		goodcode=$(($goodcode + 1))
	else
		printf "$RED\nExit Codes KO$NC pipex: $p_code // real: $r_code\n"
fi
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(cmd2 permission denied)\n$NC"
cp ../pipex pipex2
chmod a-x pipex2
errmsg=$(../pipex "infile.txt" "cat" "./pipex2" "pipexout.txt" 2> testerr.txt; cat testerr.txt | grep "ermission denied" | wc -l)
if [ $errmsg -eq 1 ]
	then
		gooderr=$(($gooderr + 1))
		printf "$GREEN\nShell Output (Errors): OK\n"
	else
		printf "$RED\nShell Output (Errors): KO\n"
fi
printf "$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(../pipex "infile.txt" "cat" "./pipex2" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat | ./pipex2 > bashout.txt; echo $?)
diffwc=$(diff pipexout.txt bashout.txt | wc -l)
if [ $diffwc -eq 0 ]
	then
		gooddiff=$(($gooddiff + 1))
		printf "$GREEN\nOutput File: OK!\n"
	else
		printf "$RED\nOutput File: KO!\n"
fi
printf "$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
if [ $r_code -eq $p_code ]
	then
		printf "$GREEN\nExit Codes OK!$NC pipex: $p_code // real: $r_code\n"
		goodcode=$(($goodcode + 1))
	else
		printf "$RED\nExit Codes KO$NC pipex: $p_code // real: $r_code\n"
fi

# ==========================RESULTS==========================================================#
rm bashout.txt pipex2 pipexout.txt testerr.txt pipexout.txt2
if [ $goodcode -eq $testnbr ]
	then
		printf "$GREEN"
elif [ $goodcode -gt $(($testnbr - 3)) ]
	then
		printf "$YELLOW"
	else
		printf "$RED"
fi
printf "\n\t✨ $goodcode/$testnbr of tests exited with the correct code ✨\n"

if [ $gooddiff -eq $testnbr ]
	then
		printf "$GREEN"
elif [ $gooddiff -gt $(($testnbr - 3)) ]
	then
		printf "$YELLOW"
	else
		printf "$RED"
fi
printf "\t✨ $gooddiff/$testnbr of tests had the correct output file ✨\n"

if [ $gooderr -eq $testnbr ]
	then
		printf "$GREEN"
elif [ $gooderr -gt $(($testnbr - 3)) ]
	then
		printf "$YELLOW"
	else
		printf "$RED"
fi
printf "\t✨ $gooderr/$testnbr of tests sent the correct error message ✨\n"

printf "$NC\n\n🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲\n"
printf "\n\t$GREEN 🌟========TESTS COMPLETED, GOOD LUCK!========🌟\n$NC"
printf "$PINK By Albert Caballero\n Intra: Alcaball\n Github: https://github.com/albertcaballero\n$NC"
printf "$NC\n🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲\n"