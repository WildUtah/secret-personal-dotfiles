#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char ** argv)
{
  int depth=2;
  if(argc > 1)
    depth=atoi(argv[1]);
  if(1>depth)
    depth=2;

  char buffer[512];
  getcwd(buffer, 511);
  char *home = getenv("HOME");
  if(NULL == home)
    home = "/Users/brian";
  int start=0;
  if(buffer == strstr(buffer, home))
    {
    start=strlen(home)-1;
    buffer[start]='~';
    }
  int seen=0;
  int i;
  for(i=strlen(buffer);i>start;--i)
    {
    if('/' == buffer[i])
      seen++;
    if(depth==seen)
      {
      if((i>0) && ('~' != buffer[i-1]))
        fputs("…", stdout);
      else
        i--;
      break;
      }
    }
  fputs(buffer+i, stdout);
  //free(buffer);
}
