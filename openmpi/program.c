#include <stdio.h>
#include <omp.h>
#include <unistd.h>

int main(int argc, char **argv)
{
	char hostname[256];
	
	gethostname(hostname, 255);

   	#pragma omp parallel
    	printf("Hello, world from %s.\n", hostname);
    
    	return 0;
}

