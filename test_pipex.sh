RED="\033[38;5;161m"
GREEN="\033[38;5;154m"
YELLOW="\033[38;5;227m"
BLUE="\033[38;5;81m"
PURPLE="\033[38;5;93m"
PINK="\033[38;5;219m"
NC="\033[0m"

testnbr=1
printf "\n🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲\n"
printf "$GREEN\n\t🌟=======ALCABALL PUSHSWAP TESTER========🌟\n$NC"
printf "$PINK\nIf there's any issue or something to improve, pls tell me!! :)\n\
	(I'm always at the campus and I'm 24/7 on Slack)\n"
printf "\n🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲\n"
printf "$YELLOW this is a manual tester, meaning that it only shows the results, but doesn't say OK/KO\
 that is up to the evaluator to discuss :)\n"

r_code=0
p_code=0

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(normal input)\n$NC"
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(./pipex "infile.txt" "ls" "cat" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt ls | cat > bashout.txt; echo $?)
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
printf "$PURPLE\nExit Codes --$NC pipex: $p_code // real: $r_code\n"
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(nonexistent infile)\n$NC"
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(./pipex "jfkasdjfkas" "ls" "cat" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<jfkasdjfkas ls | cat > bashout.txt; echo $?)
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
printf "$PURPLE\nExit Codes --$NC pipex: $p_code // real: $r_code\n"
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(dev/random)\n$NC"
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(./pipex "/dev/random" "cat" "head -1" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(</dev/random cat | head -1 > bashout.txt; echo $?)
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
printf "$PURPLE\nExit Codes --$NC pipex: $p_code // real: $r_code\n"
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(cat cat)\n$NC"
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(./pipex "infile.txt" "cat" "cat" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat | cat > bashout.txt; echo $?)
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
printf "$PURPLE\nExit Codes --$NC pipex: $p_code // real: $r_code\n"
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(cmd 1 invalid, cmd 2 doesn't need input)\n$NC"
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(./pipex "infile.txt" "jfkdjfdkj" "ls" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt jfkdjfdkj | ls > bashout.txt; echo $?)
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
printf "$PURPLE\nExit Codes --$NC pipex: $p_code // real: $r_code\n"
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(cmd 1 valid, cmd 2 invalid)\n$NC"
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(./pipex "infile.txt" "cat" "fjsdkalfjjds" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat | fjsdkalfjjds > bashout.txt; echo $?)
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
printf "$PURPLE\nExit Codes --$NC pipex: $p_code // real: $r_code\n"
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(cmd 1 invalid flags, cmd 2 doesn't need input)\n$NC"
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(./pipex "infile.txt" "cat -ghj747" "ls" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat -ghj747 | ls > bashout.txt; echo $?)
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
printf "$PURPLE\nExit Codes --$NC pipex: $p_code // real: $r_code\n"
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(cmd 1 valid, cmd 2 invalid flags)\n$NC"
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(./pipex "infile.txt" "cat" "cat -dfsa2332" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat | cat -dfsa2332 > bashout.txt; echo $?)
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
printf "$PURPLE\nExit Codes --$NC pipex: $p_code // real: $r_code\n"
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(absolute paths for cmds)\n$NC"
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output Error:\n$NC"
p_code=$(./pipex "infile.txt" "/bin/cat" "/bin/ls" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt /bin/cat | /bin/ls > bashout.txt; echo $?)
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
printf "$PURPLE\nExit Codes --$NC pipex: $p_code // real: $r_code\n"
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(permission denied infile)\n$NC"
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output Error:\n$NC"
chmod 000 infile.txt
p_code=$(./pipex "infile.txt" "cat" "cat" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat | cat > bashout.txt; echo $?)
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
printf "$PURPLE\nExit Codes --$NC pipex: $p_code // real: $r_code\n"
chmod a+rw infile.txt
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(permission denied outfile)\n$NC"
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output Error:\n$NC"
chmod a-w pipexout.txt
chmod a-w bashout.txt
p_code=$(./pipex "infile.txt" "/bin/cat" "/bin/ls" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt /bin/cat | /bin/ls > bashout.txt; echo $?)
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
printf "$PURPLE\nExit Codes --$NC pipex: $p_code // real: $r_code\n"
chmod a+w pipexout.txt
chmod a+w bashout.txt
testnbr=$(($testnbr + 1))

printf "\n$BLUE====TEST $testnbr ==============$YELLOW(cmd2 permission denied)\n$NC"
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output Error:\n$NC"
cp pipex pipex2
chmod a-x pipex2
p_code=$(./pipex "infile.txt" "cat" "./pipex2" "pipexout.txt"; echo $?)
printf "$PINK\t\t-Real Output Error:\n$NC"
r_code=$(<infile.txt cat | ./pipex2 > bashout.txt; echo $?)
printf "$PURPLE\nShell Output (Errors):\n$PINK\t\t-Pipex Output File:\n$NC"
cat pipexout.txt
printf "$PINK\t\t-Real Output File:\n$NC"
cat bashout.txt
printf "$PURPLE\nExit Codes --$NC pipex: $p_code // real: $r_code\n"
testnbr=$(($testnbr + 1))

rm bashout.txt pipex2 pipexout.txt

printf "$NC\n\n🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲\n"
printf "\n\t$GREEN 🌟========TESTS COMPLETED, GOOD LUCK!========🌟\n$NC"
printf "$PINK By Albert Caballero\n Intra: Alcaball\n Github: https://github.com/albertcaballero\n$NC"
printf "$NC\n🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲🔳🔲\n"