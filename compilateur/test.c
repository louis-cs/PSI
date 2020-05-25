main() { 
    int a = 0, b, c;
    b = 80;
    c = 42;

    if (a){
        printf(b);
    }else{
        printf(c);
    }

    while(b == 80){
        b = a + c * 2;
    }
}