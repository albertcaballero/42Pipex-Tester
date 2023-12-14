# 42Pipex-Tester
Tester for the 42 cursus project: Pipex.
(Doesn't include bonus (yet))

It has a heavy focus on error handling.

The tester searches for the executable in the parent directory.
Just clone the repo **inside** your Pipex directory, move (cd) into the tester repo and run the tester with ```bash test_pipex.sh```.
1. Clone with: ```git@github.com:albertcaballero/42Pipex-Tester.git```
2. ```cd 42Pipex-Tester``` (or whatever name you called it)
3. ```bash test_pipex.sh```

## Troubleshooting (common mistakes)
1. **The tester gets stuck on Test 6 (cat cat) and/or on Test 5 (/dev/random), why is that?** \
You are not closing fds correctly, resulting in pipes still waiting for input

2. **My error messages are appearing on the output file** \
You are probably not sending them through Stderr (fd 2)

3. **My error message is the same as the real one, but it says KO** \
Yeah... that happens sometimes, still working on it, for error messages, don't rely too heavily on the OK/KO, but read them
