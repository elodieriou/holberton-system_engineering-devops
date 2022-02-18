#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

/**
 * infinite_while - Function that create an infinite loop
 * Return: Nothing
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - Program that create 5 zombie process
 * Return: Always success
 */
int main(void)
{
	pid_t child_pid;
	int i = 0;

	while (i < 5)
	{
		child_pid = fork();
		if (child_pid == 0)
			exit(0);
		else
			printf("Zombie process created, PID: %d\n", child_pid);
		i++;
	}
	infinite_while();
	return (0);
}
