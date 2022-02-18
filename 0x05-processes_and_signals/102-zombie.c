#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

/**
 * infinite_while - Function that create an infinite loop
 * Return: Always success
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
 * zombie_process - Function that create a zombie process
 * Return: Nothing
 */
void zombie_process(void)
{
	pid_t child_pid = fork();

	if (child_pid == 0)
		exit(0);
	else
		printf("Zombie process created, PID: %d\n", child_pid);
}

/**
 * main - Program that create 5 zombie process
 * Return: Always success
 */
int main(void)
{
	int i;

	for (i = 0; i < 5; i++)
		zombie_process();

	infinite_while();
	return (0);
}
