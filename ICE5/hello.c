#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main( int argc, char *argv[] )
{
   if( argc != 3 )
   {
      printf( "Usage: ./hello <instance_number> <running_time>\n" );
      return 1;
   }

   int seconds = atoi( argv[ 2 ] );

   printf( "hello: Running hello instance %s\n", argv[ 1 ] );
   sleep( seconds );
   printf( "hello: That's all for hello instance %s\n", argv[ 1 ] );
}

