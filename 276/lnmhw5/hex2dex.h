// LaToya McIntyre
// CS 270
// HW 5
// Program to go from hex to decimal

int totalD(char hexad[]){
        int total = 0;
       // Tracks the bit placement within the string
        int length = strlen(hexad) - 1;
        for(int i = length; i >= 0; i = i-1){
                char key = hexad[i];
                switch (key){
                        case 'a':
                        case 'A': total += (10 * pow(16, length - i));
                        break;

                        case 'b':
                        case 'B': total += (11* pow(16, length - i));
                        break;


                        case 'c':
                        case 'C': total += (12* pow(16, length - i));
                        break;

                        case 'd':
                        case 'D': total += (13* pow(16, length - i));
                        break; 
         
                        case 'e':
                        case 'E': total += (14* pow(16, length - i));
                        break;

                        case 'f':
                        case 'F': total += (15* pow(16, length - i));
                        break;

                        default:
                        if(key<10 && key>-1){
                          total += (pow(16, length - i) * (hexad[i]-'0'));
                        }else{
			  printf("Invalid Entry");
			  total = NULL;
			}
                        break;
                }
        }

  return total;
}
  
