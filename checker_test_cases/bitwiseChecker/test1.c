int main(int argc, char **argv) {
	int val = argc;
	int out;

	switch (val & 0x3) {


		case 0x0:
		out = 0;
			break;
  
		case 0x1:
			out = 1;
			break;
  
		case 0x2:
			out = 2;
			break;
  
		case 0x3:
			out = 3;
			break;
	}
  
    return out;
}